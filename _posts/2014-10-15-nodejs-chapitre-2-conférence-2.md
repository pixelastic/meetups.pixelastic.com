---
layout: post
title: "NodeJS - Chapitre 2, Conférence 2"
tags: nodejs
---

Pour ce NodeJS Paris S02E02, nous avons eu le droit aux joli amphi de l'école
42, avec ses poufs multicolores (et inconfortables). Pas de dossier, donc pas
très pratique de prendre des notes.

Comme d'hab, on rappelle le but du meetup (on parle de javascript en général,
et de node en particulier). Présentation du site web, de comment proposer des
talks, etc, etc.

Puis se sont enchainés plein de sponsors, beaucoup trop. Si encore il y en
avait eu un ou deux, j'aurais pu écrire quelques mots sur chacun mais là il
y en avait beaucoup trop. Le meetup commençait officiellement à 19h, mais je
pense que le premier orateur n'a pas du prendre la parole avant 20h au moins.

En vrac, Marceau Innovation (qui n'a pas beaucoup innové pour trouvé son nom)
qui aide des français à partir s'installer à la Silicon Valley. Captain Dash
(qui ont un très joli logo), qui font de la dataviz à partir des données des
clients. Puis Digital & You dont je n'ai rien compris au pitch. Et puis je
crois qu'il y avait encore d'autres sponsors ensuite mais franchement j'ai
arrété de suivre.

On a quand même ensuite pu commencer les choses sérieuses, et tant mieux car le
programme était très intéressant : Cassandra, Testing Asynchronously, Breaz.io
et Freelance Academy.

## Cassandra

Présentation de Duy Hai Doan, évangéliste chez Datastax, l'éditeur de
Cassandra. Je ne connaissais pas grand chose à Cassandra mis à part que c'était
une DB NoSQL. Je vais donc essayer de récapituler ce que j'en ai compris, parce
que ça avait l'air bien !

Donc Cassandra, ou `C*` pour les intimes, a été créé chez Facebook avant d'être
open-sourcée en 2008. C'est une base dont le point fort est la scalabilité
linéaire : il suffit de rajouter des nœuds pour scaler. Ils visent un uptime de
100%, même pendant les upgrade. Elle est actuellement utilisée par Netflix et
possède un principe de multidatacenter out of the box, avec des facilités pour
déployer sur Amazon.

Autre avantage mis en avant : la simplicité opérationnelle. Il n'y a qu'un seul
processus Java et un fichier de config.

On a eu ensuite droit à un exemple de fonctionnement. Imaginons que Cassandra
tourne avec un cluster de X nœuds (8 étant le nombre utilisé dans l'exemple),
alors chaque donnée est enregistrée sur un des X nœuds, grâce à un hash qui
permet de toujours pointer vers le même nœud pour la même donnée. Si jamais
notre charge augmente, on n'a juste besoin d'ajouter des nouveaux nœuds et les
nouvelles données seront réparties sur plus de nœuds.

Pour assurer un bonne tolérance aux pannes des nœuds, la donnée de chaque nœud
est répliquée sur les deux nœuds voisins. Ainsi, si un nœud tombe, sa donnée
n'est pas perdue et peut être récupérée depuis les deux nœuds voisins. Pour
assurer un maximum de cohérence, certains nœuds sont dédiés à un rôle de
coordinateur, pour indiquer sur quel nœud se trouve quelle donnée.

Il est possible de définir pour cela trois niveaux de cohérence : `ONE`,
`QUORUM` ou `ALL`. Ces règles s'appliquent autant pour la lecture que pour
l'écriture. Grâce à ces règles, on peut faire des arbitrages entre la rapidité
et la fiabilité de la donnée.

En mode `ONE`, on envoie l'écriture de la donnée aux trois nœuds qui peuvent la
stocker et dès que l'un des trois l'a enregistré, on rends la main. Les deux
autres nœuds l'enregistreront aussi, mais plus tard, et c'est le plus rapide
qui rends la main.

En mode `QUORUM`, on attends qu'une majorité stricte ai validé l'enregistrement
avant de rendre la main.

Et en `ALL`, on attends bien sur que tous les nœuds aient enregistré la donnée.

En lecture en `ONE`, on va aller lire sur le nœud le moins chargé au moment de
la lecture (chaque nœud garde en local une table de statistique de temps de
connexion aux autres nœuds, et celui qui a la latence la plus basse sera choisi
en priorité).

En lecture `QUORUM`, on va lire depuis un des nœuds aléatoirement, mais les
deux autres nœuds vont nous donner un hash de la donnée. Si les hash
concordent, on rends la main, sinon on va récupérer la donnée sur le nœud qui
l'a mise à jour le plus récemment, et les deux autres nœuds vont mettre à jour
leur donnée.

Le langage de requete est très proche du SQL en terme de syntaxe, mais ce n'est
pas du SQL, c'est du CQL. La primary key de chaque donnée sera son hash, ou clé
de partition.

Oui mais tout ça c'est bien beau, mais c'est quoi le rapport avec NodeJS ? Ben
juste qu'il existe un driver nodejs pour Cassandra. Ce qui est couteux en
Cassandra c'est l'ouverture des connections à la base, du coup le driver va
maintenir des pools de connection ouvertes sur chaque nœud (2 par nœud). Le
driver est optimisé pour paralleliser les requetes pour en lancer plusieurs
sans avoir à attendre le retour de chacun.

Il est possible d'identifier un ensemble de requetes par un unique streamID, et
pouvoir ainsi récupérer toutes les réponses en même temps, de manière à faire
de grosses économies en terme de latence. J'avoue que j'ai un peu moins bien
suivi cette partie.

Le driver est au courant de la topologie du cluster (nombre de nœud, latence,
etc). Des events sont lancés quand un nœud tombe ou revient à la vie. Il a des
fonctionnalités de load-balancing entre plusieurs data-center par défaut. Il
s'assure aussi que les connections vers les nœuds ne timeout pas. Si une
connection part vers un nœud mais que celui-ci est tombé, alors plutot que de
renvoyer une erreur le driver va réutiliser la même connection pour renvoyer la
même requete vers un autre nœud porteur de la même donnée. La requete sera
certes plus lente, mais elle ne sera jamais tombée en timeout.

Coté code, ça signifie créer un `Cassandra.Client` en lui donnant l'ip ou
l'adresse de quelques nœuds du cluster, et il se chargera de découvrir tous les
autres et dresser la topologie complète du cluster. On lui envoie ensuite nos
requetes en CQL, et on obtient un callback quand les données sont revenus.
Comme souvent, pour économiser les temps de traitement, on donne notre requete
sous forme de string avec des placeholders pour qu'elle soit optimisée derrière
au moment de la jouer.

Vu qu'on est en node, le driver est aussi capable de streamer les résultats
renvoyés. En interne il utilise un principe proche du cookie, pour se souvenir
de sa place dans le stream et rejouer à partir de ce point. Dans les faits cela
permet de continuer un stream même quand le nœud émetteur est tombé, on peut
simplement continuer la même requete sur un autre nœud. Grâce au cookie, on
reprends le flux au même endroit. Par contre, si on écrit plus vite dans les
données qu'on est en train de les lire, le cookie ne nous permettra pas de voir
tout.

Cassandra fournissant plus de types de donnée que ne le permet Javascript, le
driver fourni aussi des helpers pour passer ces types complexes en Javascript.

Après ce long exposé très intéressant, on a eu le droit à quelques
questions/réponses. Quelques limitations du driver actuel ont été soulevés
comme par exemple le fait que les opérations comme des count ou des sommes sur
la data ne peuvent pas être faite directement dans Cassandra. Il faut récupérer
la donnée et effectivement cette opération dans le driver. Les prochains
versions du driver devraient corriger ce soucis.

## Async is hard, test it harder

Après ça, Florent Jaby est venu nous parler de tests en NodeJS, et plus
particulièrement de tests de code asynchrone.

Le sujet des tests en Javascript est assez bien documenté, mais quand on en
vient à tester de l'asynchrone, il y a tout à coup beaucoup moins de
littérature disponible.

Bon, on commence rapidement par rappeller les fondamentaux de pourquoi on teste
: boucle de feedback plus rapide, non-regression et design émergent. Un bon
test est isolable et reproductible.

Sauf que derrière tout ces beaux principes on a quelques soucis en Node. Il est
difficile de savoir quand un test se termine vu que tout est asynchrone. Est-ce
que mes requetes sont pending ou est-ce qu'elles vont bientot arriver ? Est-ce
que tout ce que j'ai lancé est bien revenu ? Est-ce que je termine mon test ou
j'attends plus longtemps ?

Et puis surtout, on a un problème de stacktrace avec l'event loop de node.
A chaque itération on est dans un contexte différent, du coup les mécanismes
classiques de `try`/`catch` ne fonctionnement pas. On a plusieurs approches
pour contourner ce problèmes.

On peut par exemple déclarer manuellement la fin du test comme le fait Tape ou
NodeUnit. On appelle une méthode `.end()` pour signifier qu'on a assez attendu
et qu'il est temps de terminer le test. Mocha propose aussi une méthode `done`
à appeller quand le test est censé être terminé.

Une autre méthode est de planifier les assertions. On prévient qu'il va y avoir
x assertions, et on les mets directement dans les callbacks. Du coup, le test
s'arrete automatiquement dès que les x assertions sont sorties.

On peut aussi passer par des domaines, pour wrapper nos appels. On peut faire
des try/catch dessus et donc attraper les exceptions et balancer un `done`
quand ça arrive pour marquer la fin du test. Ca marche bien, ça nous donne les
bons rapports d'erreurs sur les bons tests, mais c'est pas très lisible.

Un moyen un peu meta de rendre tout ça plus lisible est de modifier la méthode
`it` pour qu'elle wrappe sont contenu dans un trycact/domain. Ca nous fait
revenir à une syntaxe plus lisible.

La fin du talk était plus sur les outils annexes aux tests comme `jshint` ou
`istanbul`. JSHint n'est plus à présenter et permet d'appliquer des règles
configurables de standard de code à appliquer et de vérifier les erreurs de
syntaxes et les pitfalls communs de Javascript.

Istanbul de son coté est un outil de couverture de code qui va nous sortir de
beaux rapport indiquant les lignes de code qui sont parcourues quand on lance
nos tests. On peut comme ça voir les parties du code qui ne sont pas testés. Ca
permet de voir ce qu'il reste à tester, ou même parfois à identifier du code
mort. Il calcule aussi la complexité cyclomatique du code, qui donne une
estimation de difficulté à le maintenir (globalement s'il n'est pas modulaire,
avec des méthodes de 100+ lignes et des `if` imbriqués, c'est mauvais signe).

Finalement, Florent termine par un conseil à ceux qui testent des streams. Ne
perdez pas de temps à tout tester, les streams sont très bien testés en interne
dans NodeJs, inutile de le faire. Il n'est nécessaire que de tester la méthode
`pipe`, ce qui rentre et ce qui sort. On mets tout dans un buffer et on test
à la fin.

## Breaz.io / Developers in tech

Je vous renvoie à mon compte-rendu des HumanTalks précédent, Jean-loup
y a donné le même talk.

## Freelance Academy

Et pour finir, Etienne Folio nous a parlé de la société de coaching de
freelance qu'il vient de monter. Il est lui même passé freelance plus tot dans
l'année et peut se targuer d'avoir un TJM à 4 chiffres, tout en ne travaillant
que 6 mois par an.

Il a monté Freelance Academy avec la promesse d'aider les développeurs qui
veulent se lancer en freelance mais qui ont peur du légal, de l'administratif,
de la compta, de trouver des clients, etc. Il propose un stage de coaching de
quelques semaines, suivi d'une année complète de formations (quelques jours par
mois). Tout ça gratuitement. Il s'engage même à payer la différence de revenu
entre le freelance et le salariat pour ceux qui se lancent, assurant à chacun
un revenu ou moins égal à celui qu'il avait en CDI.

On a été plusieurs à se demander où était l'arnaque. En fait, c'est tout
simplement que si jamais le nouveau freelance gagne plus que son ancien
salaire, il repaye la différence à Freelance Academy. Il est assuré de toucher
autant en un an que ce qu'il gagnait avant, mais l'excédent n'est pas pour lui
pendant un an. Ensuite, libre à lui de continuer son activité de freelance avec
son nouveau TJM.

L'idée est intéressante, et le freelance, bien fait, peut être très agréable.
Néanmoins, le coté "je te donne un cadeau et oh, tu l'a accepté maintenant tu
m'est redevable" me rebute dans son histoire. Mais pour en avoir discuté avec
lui ensuite, il vise essentiellement les développeurs qui ont peur de se
lancer, qui disent vouloir faire du freelance depuis des années mais qui n'ont
jamais laché la facilité du CDI. Avec l'assurance du salaire qu'il propose, il
espère pouvoir leur donner confiance.

En tout cas, ça m'a fait me rendre compte que je faisais du freelance n'importe
comment quand j'en faisais :)




