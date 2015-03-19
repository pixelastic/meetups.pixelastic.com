---
layout: post
title: "HumanTalks Mars 2015"
tags: humantalks
---

C'est [Valtech][1] qui nous a fait l'honneur de nous héberger dans leurs
magnifiques locaux. On a pu profiter des talks confortablement assis dans de
superbes fauteuils de salle de cinéma. Ça a aussi été mon bizutage comme
co-organisateur, à monter sur scène pour présenter les HumanTalks à ceux qui
n'étaient encore jamais venus. Valtech, [Mailjet][2] et [Breaz][3], les
sponsors, ont rapidement fait une petite présentation, et les talks ont ensuite
rapidement commencé.

## Tests de performances

[Claude Falguière][4] nous a parlé de la
difficulté à faire des tests de performances. Initialement, les tests de perfs
étaient là pour s'assurer que la machine cible allait réussir à tenir la charge
des requêtes qui allaient lui arriver dessus. Aujourd'hui, avec la puissance du
Cloud, il suffit d'agrandir la machine en question pour régler les problèmes de
perfs. Le but des tests aujourd'hui n'est plus de s'assurer que la machine
tienne la charge, mais que la charge coûte moins cher.

Dans le joyeux monde des entreprises, il y a deux moyens de faire de la perf.
Le premier, c'est de ne pas en faire : on fonce, on code, on déploie et ça
plante, et après on essaie de patcher pour éviter les catastrophes. Ou alors,
le problème est déjà arrivé par le passé et alors on a ancré dans le process
qu'il fallait faire des tests de perf. Alors on coche la case sur la checklist
avant de mettre en prod et ça nous donne un petit sentiment de sécurité.

Sauf que bien sur, les tests ne sont jamais réellement fait sur un
environnement équivalent à celui de production, et donc le résultat n'a pas
beaucoup de sens. Garbage in, garbage out.

Le vrai objectif final à avoir, à ne pas perdre de vue, c'est que tout doit
fonctionner en prod. On vérifie bien sur en dev si ça fonctionne, car si ça
foire en dev, ça va foirer aussi en prod, mais c'est pas parce que ça marche en
dev que le travail est terminé.

On peut extrapoler les besoins de la prod à partir d'un petit subset de dev. On
regarde les fuites mémoires, on regarde la consommation, et on peut extrapoler
sur ce que ça va pouvoir tenir/combien ça va nous couter une fois scalé.

La prod doit être monitorée, on doit avoir des metrics sur ce qu'il se passe
quand de vrais utilisateurs utilisent le système dans des conditions réelles.
Et ces informations doivent être facilement accessibles, visibles et lisibles
par tout le monde. Allez, on peut lacher le buzzword, il faut que ça soit
devOps. Il faut que les devs qui ont codé la feature puissent voir son
implication sur les ressources une fois en prod, voir la RAM utilisée, le
nombre de connexions parallèles, les bottlenecks, etc. Ce n'est que comme ça
qu'ils pourront améliorer leur soft pour améliorer les perfs.

C'est un travail régulier, un aller-retour entre le code bien couvé au chaud en
dev, puis son exposition au monde extérieur et son amélioration. On peut
rajouter quelques tests de performance automatiques, mais uniquement sur les
metrics critiques (disponibilité, temps de réponse) et les tunnels critiques
(paiement).

Mais les tests ne seront jamais assez, parce que la production est par
définition imprévisible. Et la question n'est pas _"Et si la prod plante ?"_ mais
_"Quand va la prod planter ?"_. L'infrastructure (et c'est aussi bien du point de
vue technique qu'organisationnel) doit accepter l'échec, et apprendre de ses
erreurs. Il faut quelque chose de flexible, qui scale, qui soit agile, qui
puisse apprendre et trouver des solutions. Par exemple, prévoir une possibilité
de faire du feature flipping des features les plus gourmandes permet de
réguler la charge en offrant un service minimum degradé.

Il faut aussi penser à un mode dégradé. Que se passe-t'il si l'une des briques
vient à tomber ? Est-ce qu'elle emporte tout avec elle, ou est-ce qu'on a un
backup ? Par exemple prévoir un opérateur de paiement en ligne de backup au cas
où le premier vienne à tomber permet de s'assurer que notre génération de
revenus n'est pas intimement liée au bon vouloir d'un third party. Identifier
les SPOFs et prévoir un backup.

Une bonne technique pour pouvoir tester une nouvelle feature et ses
implications en terme de perfs sans pour autant la balancer directement dans le
grand bain de la prod est d'opérer un Dark Launch. On créé en fait une copie de
la prod, mais de manière cachée, qui contient la nouvelle feature. Et pour
chaque requête qui arrive sur la prod, on la renvoie aussi sur la version dark.
On peut voir comme ça si la version dark parvient à suivre la charge ou si elle
s'écroule. Et si elle s'écroule, elle ne gêne pas les utilisateurs car elle
leur est complétement cachée. Et cela nous génère tout un tas de logs et de
datas qui vont nous permettre d'itérer encore sur la version dark avant de la
sortir du coté visible.

Une autre technique similaire est de pousser les nouvelles features à de plus
en plus d'utilisateurs, graduellement. Par exemple, une feature n'est activée
que sur demande explicite des utilisateurs, sur une liste triée représentative
ou pour un pourcentage aléatoire. La feature est techniquement en prod,
déployée pour tout le monde, mais le feature flipping sélectif s'assure que
tout le monde ne soit pas impacté directement.

Ces deux méthodes possèdent néanmoins un défaut, c'est sur la structure des
données. Si une partie des utilisateurs ont accès à une feature et pas l'autre,
il est probable que la structure de leurs données soit différente. Il faut donc
bien s'assurer qu'on puisse faire cohabiter les deux.

Finalement on a aussi un peu parlé de la Simian Army de Netflix qui ressort
dans toutes les présentations de ce genre. Elle leur permet de tuer
aléatoirement des nœuds de leur infra en suivant le principe que _"de toutes
façons, la prod va péter, alors autant que ce soit nous qui le fassions"_.

Au final, encore une fois, pas de scaling sans devOps.

## L'holacratie, travailler sans manager

[Olivier Le Lan][5], coach agile de
[SOAT][6] nous a fait un retour d'expérience sur le
changement d'organisation qu'ils ont eu au sein de leur équipe de coachs agiles
à SOAT. 4 coachs, managés par une personne.  Puis un jour le manager s'en va,
et les 4 coachs se demandent s'ils ont besoin d'un manager, ou s'ils peuvent se
débrouiller seuls.

Le terme holacratie vient du grec holons, qui veut dire aussi bien l'entité
constitutive, que le tout qu'elle constitue.

En suivant l'adage que _"Le management, c'est bien trop important pour le
laisser à une seule personne"_, ils ont trouvé une autre solution. Le
management, c'est une technologie qui sépare les exécutants des pensants, et
comme toute technologie, elle finit par être dépassée. L'agile de son coté
remets en cause tout ça, incite les équipes à s'auto-organiser, à faire
confiance à l'intelligence collective. Du coup, est-ce que le management est
utile en mode agile ?

Il nous a parlé de [Zappos][7] qui a viré ses 1500
managers, et remis tout le monde au même niveau de hiérarchie. 

Chez Soat ils se sont séparés en différents cercles, regroupés par affinités,
par buts (cercles de coachs agile, cercles par projets, cercles par techno,
etc). Chaque individu faisant partie de plusieurs cercles, et chaque cercle
étant auto-organisé.

Le principe fondamental de l'holacratie est qu'on continue d'avoir un manager,
mais ce n'est plus une personne, c'est un rôle, qui est tournant au sein des
individus d'un même cercle. Chaque individu peut avoir plusieurs rôles (dans
différents cercles) et plusieurs individus peuvent avoir le même rôle.

C'est pour le moment une expérimentation chez SOAT, qui porte ses fruits dans
le cercle des coachs agiles. À eux 4 ils se sont répartis les rôles et les
changent régulièrement (une réunion par mois où les rôles peuvent être
changés), chacun est responsable d'être le lien privilégie avec les autres
cercles de SOAT (comm', rh, etc).

Le point principal pour la création d'un cercle auto-géré comme cela c'est que
tous les acteurs doivent être alignés sur le WHY de leur cercle ET sur le WHY
de leur entreprise. Même si les objectifs de chacun sont légérement différents,
le but n'est pas d'avoir un consensus de tous, mais un consentement de chacun.
Il ne faut pas que tout le monde dise oui, il suffit que personne ne dise non.

Il y avait un sceptique dans la salle pour qui une telle organisation était
utopique, et qui était rassuré de voir qu'on ne supprimait pas le management,
mais qu'on supprimait juste le manager. La différence est que ce rôle de
manager qui est dévolu à l'un des membres du cercle ne doit pas lui prendre
plus de 10% de son temps, par opposition à un individu dont c'est le travail
fulltime.

REX très intéressant au final, l'expérience semble très bien se passer à SOAT.

## Ionic Framework

[Loïc Knuchel][8] nous a ensuite parlé d'un sujet
plus tech, le framework [Ionic][9].  Mélange
d'[Angular][10] et de
[Cordova][11], il permet de développer des
applications hybrides assez facilement.

Loïc est un dev-front end et un entrepeneur, et il a plein d'idées. Et la
plupart du temps, ces idées se décomposent sous forme d'appli mobile. Avec
Ionic, il peut rapidement faire des protos pour les tester.

Ionic est livré avec une batterie de composants (packagés sous forme de
directive Angular) pour la majorité des besoins de UI des applis d'aujourd'hui.
C'est un peu le [Bootstrap][12] de la UI mobile web, avec
des sliders, des listes, des boutons, des pull-to-refresh, des popovers, des
onglets, etc.

Visuellement, les styles sont très orientés iOS mais une version Material est
en cours. Ionic est aussi livré avec un petit outil en ligne de commande qui
permet de générer un splashscreen, des icones, de gérer le livereload,
d'inclure [Crosswalk][13] pour une execution plus
rapide, et de tester les différentes vues Android/iOS directement dans le
browser.

La version 1.0 vient de sortir officiellement, ce qui donne vraiment envie de
tester le système pour des POCs rapides. Pour une petite idée d'appli qui reste
dans les standards de UI actuels, et pour se concentrer uniquement sur le
fonctionnel, ça semble un choix tout à fait sain. Je testerai sans doute sur un
side project bientot.

Il n'y a pas de gestion native de l'offline, mais des plugins cordova (donc
non-spécifiques à Ionic) permettent de l'ajouter.

Bien sur, ça reste du web mobile, avec de l'Angular, dans une WebView donc oui
ça sera moins rapide que du natif, mais ça restera assez rapide pour qu'on ne
s'en plaigne pas. Ça a aussi l'avantage de pouvoir se prendre en main plus
facilement par des fronteux, et ça peut soit se packager sous forme d'app, soit
directement accessible sous forme de site web (et dans ce cas, pas besoin
d'approbation du store).

## L'intrapreneuriat, qu'est-ce que c'est ?

Finalement, c'est [Christopher Parola][14],
co-fondateur d'[elCurator][15] qui vient nous parler
d'intrapreneuriat. Ayant suivi un peu la vie d'elCurator à Octo, son talk
a quand même répondu à quelques questions que je me posais sur cette structure
(pourquoi ? qui possède quoi ?).

Il nous raconte un peu le début du projet, une idée qui avait été lancée
à Octo, lui et [Jérémy][16] qui travaillent
dessus sur leur temps perso, le partage au sein d'Octo. C'était un parfait bac
à sable pour eux deux pour apprendre [Rails][17] et le
Lean Startup. 2 ans plus tard, elCurator est une structure à part entière et
eux deux en sont salariés.

Question financement, au début tout est payé de leur poche : nom de domaine,
hébergement. En tournant sur [Heroku][18], ils limitent
énormément les coûts. Plus tard, ils seront hébérgés dans les locaux d'Octo.

Pourquoi avoir fait la bascule au bout de 2 ans ? Pour eux, c'est parce qu'ils
commençaient à avoir des clients, et l'envie de travailler sur le projet
à temps plein, mais cela peut-être fait plus tôt, voire dès le début.
L'intrapreneuriat est encore quelque chose d'assez vague, il y a très peu de
littérature sur le sujet et peu d'exemples, donc il n'y a pas vraiment une
seule façon de faire, c'est en fonction du projet, des sociétés et des gens.

C'est d'autant plus flagrant au niveau de la structure juridique. Il n'y
a aucune règle particulière, aucun statut spécial, tout est encore une fois
à faire en bonne intelligence avec l'entreprise. Dans le cas d'elCurator, ils
ont monté une SAS, et se sont répartis les parts. La question de la propriété
intellectuelle du produit est par contre une question plus complexe à résoudre,
surtout dans le cas d'elCurator où une partie a été créé sur du temps perso et
une autre sur du temps de salarié Octo. Son conseil: statuer sur ce point le
plus tôt possible.

Le même conseil est donné quand à la répartition des parts. Plus la société est
créée tard, et donc plus la répartition des parts à lieu tardivement, plus les
négociations sont complexes. Une fois que le projet est parti, que du monde
a travaillé dessus, qu'il rapporte déjà de l'argent, il est plus dur de
discuter séparation des parts. Bien sur, il ne faut pas non plus commencer à se
séparer les parts alors que rien n'a été créé, on risque de tomber dans le
syndrome du groupe de rock d'adolescents qui splitte avant d'avoir écrit la
moindre chanson car ils ne sont pas d'accord sur comment séparer leurs futurs
millions.

Dans le cas d'elCurator, la séparation a été effectuée équitablement entre les
deux associés et Octo, puis Octo a abondé pour racheter des parts, un peu comme
une levée de fonds.

Pour l'entreprise, incuber une société lui permet d'innover dans un domaine qui
n'est pas son domaine premier, lui permet de se diversifier, et de ne pas
perdre des collaborateurs qui seraient sinon partis faire leur projet ailleurs.
Pour les créateurs, l'avantage majeur est la sécurité. En restant incubé chez
Octo, ils continuaient de garder leur salaire pendant 2 ans, tout en
bénéficiant de locaux, d'un écosystème et d'un carnet d'adresse.

La différence majeure entre un intrapreneur et un entrepreneur se situe ici.
L'entrepreneur se moque des risques, il croit fermement à son idée et est prêt
à vivre de peu, de travailler beaucoup, pour monter son idée.

Finalement une question de l'assistance qui m'a semblé assez folle, sur une
rumeur qui court sur Octo. D'après la personne qui posait la question, Octo
donnerait environ 20% de temps à chaque employé pour travailler sur des projets
perso (à la Google), mais si jamais ces projets sont rentables, tout les
bénéfices vont dans la poche d'Octo. Pour être plutôt bien placé pour le
savoir, je peux dire que cette rumeur n'est vraie ni dans ses fondements ni
dans ses conclusions.

## Conclusion

Super session, comme d'habitude. 4 talks très intéressants et des discussions
qui ont duré jusque tard dans la nuit après coup. Du technique, de l'orga, des
retours d'expérience, un très bon mélange !


[1]: http://www.valtech.fr/fr
[2]: https://www.mailjet.com/
[3]: https://breaz.io/
[4]: https://twitter.com/cfalguiere
[5]: https://twitter.com/o_olelan
[6]: http://www.soat.fr/
[7]: http://www.zappos.com/
[8]: https://twitter.com/loicknuchel
[9]: http://ionicframework.com/
[10]: https://angularjs.org/
[11]: https://cordova.apache.org/
[12]: http://getbootstrap.com/
[13]: https://crosswalk-project.org/
[14]: https://twitter.com/chrisparola
[15]: https://www.elcurator.net/
[16]: https://twitter.com/jeremyvenezia
[17]: http://rubyonrails.org/
[18]: https://www.heroku.com/
