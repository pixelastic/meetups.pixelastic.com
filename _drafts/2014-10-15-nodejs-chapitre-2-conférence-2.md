---
layout: post
title: "NodeJS - Chapitre 2, Conférence 2"
tags: nodejs
---

Ecole 42 petit amphi, des jolis fayteuioisls bien colrés, mais pas de dsossier,
donc pas pratique pour écrire dans de bonnes conditions.pRésentation classique
sur ce qui est proporsé dasles meetups node (du front en général, du moment que
ca touche à node au moins de loin).

Ils ont un site nodejsparis.fr pour proposer des talks ou demander des sujets.
Spéakers bénévoles, pas de remaque tout haut, on échange ensuite et on prpose
un contretalk.

Sponsors.
Marceau Innovation. Startup, aide les talents francais à partir à la syliicon
valley. On les contacte, ils se paye,t aiès des spocoyés; Organise des voyages
phyqiques et faire rencontrer des entreprises, speed recruiting. rebe,or abev
des psotop,s cpùùercoames dejob. Vont s'ouvre vers une marketplace.
Nicolas Bourdin, Edouard Murat. Deux personnes, CEO, COO.

Captain Dash.
Startup de databoz ey data aggregation. Ils prennent les données de deivers
sources de clients et vont les aggréger sous forme dynamique sur ipad, etc pour
avoir des jolis lmibraneles pour prendre de décisions. Ils receuten,t bien sur
des devs nodejs. Dashboard statistique temps reel sur des apis twitter etc,
projet en cours.

Digital & You
Nima Karimi. Amoureux. Son onvle iranien est tombvée amoureux à 40 et quelques
il y a seulement quelques années. 

Trop de sponsors, long. Pour un meetup qui commence à 19h.

## Cassandra


Duy Hai DOAN, évangelist pour datastax, qui fait Cassandra. Travaille sur de
l'ope source, sur Achilles, un object mapper pour Cassandra.

C\*, quick intro. Base NSQL, créé chez Facebook et opesourcé en 2008. Orienté
colonnes, puis tables distribuées. Point fort, scalabilité linéaire. Il suffit
de rajouter des noeuds pour scaler, trés simple. Dispo continuer, vise le 100%
uptime, même pendant les upgrade (utilisé par Netflix). Multidatacenter narif,
out od the box, configurable pour amazon.

Amélioration à venir, de garder une performance constante même en cas de perte
de noeud. Dernière avantage, la simplicité opréationnel : un process java et un
fichier de config.

Exemple d'un clister de 8 noeuds, qui disive la plage de hash en 9 parties,
avec un token de hash pour savoir où une donnée se trouve sur le cluster. La
méthode de hash permet de sitribuer de manière équitable entre les noeurds. Si
notre charge augmente, on ajoute des noeuds et le hash lcpontinue de les
répartir de maniè-re équitable.

Pour assurer une failure tolerence, on réplqieu nos données sur les noeuds
voisins. comme ça si un noeud tombe, ona  encore les données en backup sur les
noeuds à coté. Pour assurer la cohérence, certains noeuds sont des
coordinateurs qui indique sur quel noeud la donnée est stockée. 

On peur choisir trois niveaux de cogérence. ONE, QUORUM et ALL. S'apllique
autant pour le lecture que pour l'écriture. Quorum c'est sur la majorité
stricte.

ONE. Les écritures sont envoyées sur les trois, mais dès que l'un des tois l'e
enregistré, il repasse la amain. Les autres ACK arrivent ensuite en asynchrone.

QUORUm. On attends qu'il y ait une majorité de noeus quie répondent avant de
rendre la main. Et ALL? evidemment on attends tout.

En lecture en ONE, on lit sur le réplicat le moins chargé. Chaque noeud garde
une table de stat sur le temps de latence de connection aux autres; Celui qui
a le moins de latence sera lu en pririté.

En read queroum, on lit depuis l'un des noeuds, mais les autres du queroum
donnent un hash de la donnée. Si ok, on rends la main, si pas ok, on va
retourner la donnée la plus fraiche et mettre à jour la donnée des autres
noeuds sur les auutres noeuds.

Du coup, comme toujours on choisit entre la rapidité et le niveau de cohérence.

Le CRUD ressemble beaucoup à du SQL, mais c'est dy CQL. Même syntaxe. On
indique la primary ley comme étant la clé de partition.

Coté nodeks, comment ça se passe ?

Le driver va mantenir des ools de connection sur chaque noeud (2 par neoud). On
fait de spools pour ne pas avoir à réouvrir les connectins car en prod on se
retrouve avec facilement plus de 100 noeuds. Le driver permet d'optimiser les
requetes sans attendre le retour d'une pour lancer la suivante.

En identifiant les requetes par un streamID, on peut mettre toutes les réponses
d'une même requete en même temps. On économise sur la latence.

Le driver permet de se maintenir à jour de la topologie du cluster? Il écoute
el cluste pour savoir quand des noeuds tombent ou sont ajouté. il permet de
faire du load-balancing mutli-datacenter par défaut.

Failover. Quoi faire qund on perds des noeuds. Comment gerer les timeout quand
les noeuds tomvent. Le coordinateur décide qu'n noeuds est le moins chargé,
mais si celui-ci tomve, le coordinateur va alors renvoyer vers le deuxieme
noeuds mort. La requete sera certes plus lente, mais il n'y aura pas de timeout
visible pour l'utilisateur final.

Coté node, on créé un Cassandra.Client en lui donannt l'adresse ip ou DNS de
quelques noeuds, il découvre les autres noeuds ensuite tout seul. e. on peut
ensuite lui envoyer des requetes proches du SQL, et un callback quand ona  le
retour. Pn prépare les requetes sous forme de string avec des placehold, et un
objet pour les remplacer au moment de l'executer.

Il peut streamer les résultat en utilisant un principe de pagination avec un
"cookie" qui permet de reprnedre un stream à un endroit donné. Même si un noeud
tombe, on peut repasser ce cookie posur un autre noeud pour reprendre au même
endroit. Il le faut tout seul, encore une fois la latence sera lus forte mais
au moins, pas de timeout, ca reste transparent.

On écoute sur le sream classiquement ensuite.

Casandra supoprtplus de types que Javascript. Cassandra fourni des helpers pour
passer de types complexes en javascript.


NOtion de keyspace, qi est un container de tables.

Question : Comment se passe le strea si une cérituere est plus rapide que la
lecture. Dans ce cas, on risque de relire pluseurs fois la même chose ou de
rater des éléments. Pas prévu pour.

Ajourdhui pour faire des sommes ou des counts, il faut récupérer toutes les
données et faire l'aggrégation coté client. Les prochaines versions permettront
de faire des aggrégats directement par Cassandra.

Cassandra peut detecter les problemes hardware. On définit si on souhaite que
le noeud s'arrete ou qu'il isole les fichiers corrompus (qui peuvent etre
réparés).

Le driver permet de savoir un peu plus sur le fonctionnement du cluster. On
peut avoir la topologie, les noeuds qui sont up ou down. Mais tous les drivers
ne retournent pas encore autant d'information. On ne peut pas encore, mais on
pourra faire du onnodeup, onnodedown, etc.

## Async is hard, test it harder

Probleme des tests, beaucoup de littérature sur el sujet, mais pas beaoucp en
saynchrone.

Rappel sur pourquoi on tests. Avoir une boucle de feedback le plus rapide, test
avant de code, le plsu rapide. On s'assure des non rgression. Design emergent,
donne des éléments modulaires et indépendant. prouve que le code fonctionne et
donc évite les problèmes en prod.

Bon test est globalement isolé et reproductible. Isolé, on lance dans n'importe
quel ordre et mee résultat. reproductible, donne toujours les même sréultats.

En nodejs;, il est difficile de savoir quand un test se termine. Comment savoir
quand on doit tester que tout est bien arrivé si plein de callback à la fin.
Est-ce qu'on doit arreter le teste ou attendre plus longtemps.

les mécanismes de try catch ne fonctionn e pas avec la boucle d'event de node.
avec l'event loop, la pile est perdu à chaque itérayion, donc on perds le
contexte forcément.

Approche 1. On déclare la fin du test. Exemple, tape. On indique du t.end()
pouir dire qu'on a fini le test. NodeUnit, pareil. 

Mocha, on passe un done à appeller quand on a fini, mais ne marche pas.
probleme, c'est qu'avec plein de tests il pete sur exception mais qui n'est pas
lié au test sur lequel il est en rain d'itérer. La manière de faire serait de
faire un trycacth autour de ce qu'on teste.

Du coup, on planifie des assertions. On indique qu'il va y avoir x assetions.
Pas besoin de mettre des end, il s'arrete quand x assertions sont sorties.

Mocha est plus lisible, mais lance des excetions, et que ça ne marche pas en
asynchrone. On peut régler ça avec des domaines, pour les wrapper. 9a peut
capter des exception et appeller done quand uen sception arrive pour indiquer
la fin du test. Ca marche, ca marche avec mocha, et un peu partout, mais c'est
pas trés lisile. Permet e garder le contexte et de savoir à quel test c'est
lié, du coup on a des rapports d'erreus sur les bons tests

On peut étendre la fonction it, pour la wrapper dans un trycatch/domain. Ca
devient un peu meta, mais ça rends tout ça plus lisible.

Outils. jshint. configurable, permet de verifier des standards de code et
d'attraper les erreurs de syntaxe rapidement.
istanbul pour la couverture de code
$ istanbul cover nodeunit test
permet de voir les lignes du code qui sont executées quand on lance un test.
genere des rapports de tests e, jtml. techniquement il modifie les fichiers et
ajoute un `line++` sur chaque ligne et finalement permet de voir sur quelles
lignes il est passé ou non. Permet d evoir où on passe et om on ne passe pas.

permet de voir les branches où on ne passe pas, du coup, on voit là où il
manque des tests.

calcul de complexité cyclomatique. Permet de voir si le code est compliqué ou
non, et qui donne une information sur la maintenabilité du code en général. lié
aux lignes de code, aux imbrications de if, de callback. Plus c'est complexe et
plus c'est compliqué à maintenir.

Pour tester les streams, ne testez que la méthode pip. Tester ce qui rentre et
ce qui sort. On mets dans un buffer et on test à la fin. Les streams dans le
core sont très bien implementées et testées, du coup ne se concentrer que sur
nos méthodes pipe.





## Developers in tech

## Freelance Academy




