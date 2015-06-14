---
layout: post
title: "HumanTalks Juin 2015"
tags: humantalks
---

Pour le mois de Juin, c'est Viadeo qui a pu nous accueillir. On avait 120
personnes inscrites, mais on était dans les faits plus proche d'environ 90 sur
place. Viadeo nous a accueilli dans leur cantine et on a pu ensuite se régaler
de ce que leurs cuistots nous avaient préparés.

Une session formidable, avec 4 talks passionants pour contrebalancer la session
du mois précédent qui m'avait un peu laissé sur ma faim. Cette fois on a parlé
de RAML, de sociologie, d'UX et d'école de développement.

# RAML

XXXXXXXXX nous a parlé de RAML, un format pour spécifier ces APIs. Le formalisme
du langage permet ensuite d'automatiquement générer la documentation qui va avec
et pourquoi pas de la tester automatiquement.

On le sait tous, le gros problème de la documentation c'est qu'elle n'est jamais
à jour avec le code. Tout simplement parce que c'est une tâche chiante à faire
et qu'on la néglige bien souvent. Ici, RAML se situe dans la même lignée que les
annotations, en permettant de spécifier son API en même temps qu'on la
documente. Spec et doc ne font qu'un.

RAML en terme de syntaxe, c'est du YAML, et ça veut aussi dire Restful API Model
Language. En gros, on peut définir plusieurs versions de notre API, et pour
chacune d'elle spécifier son url, ainsi que les endpoints possibles. On peut
bien sur faire une hiérarchie de endpoints qui reflètent la hiérarchie de nos
url, et pour chacun des niveaux indiquer une petite description ainsi que les
paramètres attendus. 

Tout ceci sera alors utilisé pour générer automatiquement la documentation à la
manière d'un Swagger. Pour chacun des endpoints on peut bien sur spécifier des
actions différentes selon le verbe utilisé, ainsi que la liste des paramètres
attendus (qu'ils viennent de l'url, d'une query string, d'un body ou même de
headers).

Pour chacun de ces paramètres, on peut spécifier le type attendu, s'il est
obligatoire ou non, et faire de même pour le type de réponse attendue ainsi que
le code retour. On peut aussi bien sur spécifier des exemples pour chacun d'eux.
Pour ne pas écrire des fichiers trop énormes ont peut bien sur utiliser des
templates et inclure des fichiers.

Tout ceci permet de définir dans un langage standard notre API. Il existe des
parseurs de RAML dans plusieurs langages et déjà quelques outils qui en tirent
partie (génération de docs, tests d'intégration, voire même génération d'un CRUD
simple).

Il y a plusieurs projets collaboratifs pour définir la spec RAML de certaines
API bien connues comme Facebook, Twitter ou GitHub. Il n'est pas encore possible
de détecter automatiquement quand une de ces API a ajouté de nouveaux endpoints
grâce à RAML, mais on peut déjà tester si certains retours ont changés ou si
certains endpoints ont disparus.

Je ne connaissais pas du tout RAML mais je préfère largement ce formalisme de
spec d'API que de faire un gros fichier doc, car c'est parsable et qu'on peut
donc à terme le tester et générer la doc qui va avec.

# Sociologie appliquée au développeur

Sous ce titre assez étrange, c'est Sylvain Abélard qui nous a fait un talk
ultra-touffu sur une douzaine de théorèmes et effets sociologiques qu'on est
forcément amenés à croiser dans le monde professionnel.

Beaucoup d'humour et passionnant, je vous recommande chaudement de regarder le
talk mais surtout d'aller lire plus en détail plus d'informations sur chacun de
ces effets.

Sylvain est développeur, mais quand sa boite a commencé à grossir et qu'il a du
embauché d'autres développeurs il s'est retrouvé à aussi devoir les manager.
Mais lui il code, il ne sait pas forcément comment gérer des humains. Du coup,
il a fait comme pour tout nouveau framework qu'il ne connait pas : il a lu la
doc. Et c'est donc après en avoir appris un peu plus sur la manière donc
fonctionne le cerveau humain et particulièrement dans un contexte d'équipe qu'il
nous a fait cette liste.

On a tous déjà remarqué que plus une boite grossit et plus on a l'impression que
les gens vont dans des directions différentes, que tout le monde pense avoir (ou
pas d'ailleurs) l'intéret de la boite à cœur, mais que pour autant tout le monde
n'est pas aligné. Et le pire c'est que la majorité du temps, ce n'est même pas
de la méchanceté, encore moins de l'incompétence, juste des raisons différentes
que chacun ne peut ou ne veut pas forcément exprimer.

Pour mieux comprendre tout ça, Sylvain a donc posé des mots et nommé une
douzaine d'effets, principes et théorèmes.


## Principe de Peter

Celui-ci est simple, et on le croise tous autour de nous. C'est tout simplement
que le principe même de hiérarchie et de promotion fait que des gens
incompétents se retrouvent à des postes hauts placés. 

Comment ça se fait ? Tout simplement parce que quand on est bons à ce qu'on
fait, on obtient une promotion pour accèder à une position plus importante. Au
début on n'est pas très bon à cette position, parce qu'on y débute, mais on
finit par apprendre. Alors on monte encore d'un échelon, et encore d'un. Mais
à un moment, on finit par ne plus monter, parce qu'on a atteint le maximum de ce
qu'on était capable de faire.

Sauf qu'on n'est jamais rétrogradé. On ne redescends jamais au poste précédent,
celui où on bon. Cela signifie qu'au bout d'un moment, chacun se retrouve en
poste à un poste où il n'est pas bon. 

Du coup, il faut être plus conciliant avec les incompétents. Ils ne sont
peut-être pas bons à ce qu'ils font en ce moment, mais s'ils sont là c'est parce
qu'ils étaient très bon à autre chose avant.

## Dunning-Krueger Effect

Celui-ci, je l'adore. J'ai découvert la sensation il y a quelques années mais je
ne savais pas qu'il avait un nom (et c'est d'ailleurs Sylvain qui m'avait filé
le lien vers plus d'explication).

Cet effet explique simplement que _celui qui sait sait qu'il ne sait pas, alors
que celui qui ne sait pas ne sait pas qu'il ne sait pas_. En d'autres termes, si
vous êtes compétents dans un domaine, vous savez juger vos limites, vous savez
ce que vous savez faire, vous savez ce que vous ne savez pas faire, vous voyez
la réelle étendue du problème. Alors que celui qui est incompétent sera
incapable de juger la réelle difficulté d'une tâche. Parce qu'il ne s'y connait
pas vraiment, il ne verra pas ce qu'elle implique réellement et elle lui
paraitre simple car il ne verra pas toute la complexité cachée que vous pouvez
voir.

C'est malheureusement pour ça que les incompétents paraissent sûrs d'eux mais
que les gens compétents paraissent douter.

## Hawthorne Effect

Le nom vient sans doute du psychologue qui a tenté une étude de productivité
d'ouvriers dans une usine. Il cherchait à savoir si le degré de luminosité de la
pièce où ceux-ci travaillaient avait un impact sur leur productivité.

Du coup, il a essayé d'augmenter la lumière pendant une semaine pour voir. Et il
s'est avéré que oui, les ouvriers produisaient plus. Du coup, la semaine
suivante il a encore monté encore plus la lumière et la productivité s'est
encore accrue. Alors il a tenté de la pousser au maximum, au point de les
éblouir et oui, ça a encore mieux marché.

Du coup, il s'est douté que quelque chose ne tournait pas rond dans son
expérience alors il a essayé de baisser la luminosité, en dessous du seuil
inital et là encore la productivité était meilleure. Complétement surpris, il
a remis la lumière à son état initial et là encore, productivité améliorée.

Il n'y comprenait alors plus rien. Jusqu'à ce qu'il réalise que le changement de
lumière n'avait aucun impact sur la productivité de ses employés. C'était tout
un tas d'autres facteurs : avoir son patron qui surveille, avoir une mesure
à atteindre, changer les conditions du bureau, etc qui influençait leur travail.

Le Hawthorne effect indique juste qu'en modifiant quelques éléments, aussi
subtils que changer son bureau de sens ou travailler dans un nouveau lieu donne
de nouvelles idées, change les habitudes et permet de travailler différemment,
bien souvent avec un effet bénéfique.

## XY Problem

Celui-là est moins connu. On le retrouve quand on pose une question à quelqu'un
mais qu'on à l'impression qu'il réponds à coté. On demande de l'aide à quelqu'un
pour résoudre le problème X, mais lui nous donne la solution pour résoudre le
problème Y parce que de son expérience, la cause du problème X est bien souvent
Y, alors il souhaite nous faire gagner du temps.

Sauf qu'en n'expliquant pas le processus, on à l'impression que l'autre ne
comprends pas notre problème, ou s'en fout, et ne nous aide pas. Et c'est
d'ailleurs tout à fait vrai, on n'aide pas quelqu'un en lui donnant la solution
à un problème qu'il n'a pas.

## Effet d'audience

Cet effet est assez simple et indique que parfois, regarder par dessus l'épaule
de quelqu'un quand il fait une tâche peut avoir un effet bénéfique, parfois cela
peut avoir un effet nefaste. En effet, quand une tâche est simple, on
procrastine, on glande un peu à la faire, du coup si on est surveillé, on est
plus concentré. Au contraire, si la tâche est complexe, surveiller quelqu'un va
simplement le ralentir, voir l'empecher complétement de la completer.

Le mieux est simplement de demander de temps en temps où l'autre en est, mais
pas trop souvent.

## Ringelman effect

Sous ce nom compliqué se cache simplement l'effet de groupe. Plus un groupe est
gros, moins il est efficace car il faut gérer, en plus de la tache à executer,
l'overhead de la coordination du groupe. De plus, avec le grossissement d'un
groupe arrive aussi la dilution de la responsabilité.

Quand on est seul, si quelque chose ne marche pas, c'est forcément qu'on
a merdé. Même quand on est que 2 ou 3, on ne peut rebalancer la faute sur les
autres tout le temps. Par contre quand on commence à être nombreux, si quelque
chose foire, c'est jamais directement de notre faute, c'est un peu la faute de
tout le monde, du coup c'est la faute de personne. Et puis même si c'était de
votre faute, il y a peu de chance qu'on puisse remonter jusqu'à vous.

Ce genre d'ambiance plombe complétement la motivation, car de la même manière
que vous ne pouvez pas être blamé, vous ne pouvez pas non plus être récompensé.
Si ce n'est la faute de personne quand ça foire, c'est grâce à personne non plus
quand ça réussi.

Pour contrer ça, laissez de la liberté à chacun, limitez la hiérarchie au
maximum (3 couches MAX).

## Woozle effect

Le principe de la rumeur. Comment les rumeurs et les légendes urbaines se
forment. Comment à force de répeter et d'entendre tout le temps les mêmes
fausses informations on fini par les assimiler comme des vérités et les répandre
nous même.

Vérifiez vos sources, attention aux "untel à dit ça", méfiez-vous des vérités
générales.

## Matthew effect

Si quelqu'un dans votre équipe est très compétent et qu'il est capable de faire
un certain nombre de tâches plus rapidement que n'importe qui d'autre, il y a de
fortes chances que vous alliez toujours le voir pour faire ces tâches.

Du coup, cette personne n'a alors plus le temps de faire ses autres tâches,
voire si vous êtes plusieurs à aller le voir, il n'a même plus le temps de faire
cette tâche là. Alors que pendant ce temps tout le reste de l'équipe, on ne lui
demande rien.

Dans ce cas, il faut faire faire monter en compétence et déléguer. Machin est
peut-être plus rapide, mais si vous l'étouffez à toujours venir le voir, il
finira par partir. Laissez Machin déléguer et apprendre aux autres, qui seront
certes moins rapides mais qui peuvent être plusieurs à executer ces tâches en
parallele et vous désengorgez les process.

La solution n'est pas de virer ceux qui sont trop lents, et de ne garder que des
experts d'une tache. À la place il faut faire monter tout le monde en compétence
sur toutes les taches, pour avoir une équipe pluri-disciplinaire.

## Catfish effect

Celui-là, je le connaissais pas ! L'histoire veut qu'un groupe de pêcheurs en
haute-mer revenait régulièrement au port avec de grosses cargaisons de sardines.
Mais après un si long voyages, leurs sardines n'étaient plus forcément très
fraiches. Et les sardines peu fraiches se vendaient moins cher que les sardines
fraiches.

Pourtant, il y avait toujours un bateau qui allait pêcher au même endroit,
revenez en même temps que les autres et pourtant avait des sardines plus
fraiches. Son secret était qu'il gardait avec ses sardines un poisson-chat, qui
tenait les sardines en éveil, pour ne pas se faire manger.

L'émulation d'avoir un plus gros poisson avec elles, la compétition pour ne pas
se faire manger les forcaient à rester alerte. Dans le monde du travail, cela ne
signifie pas de mettre un tueur sanguinaire au sein de votre open-space pour
motiver tout le monde. Non, l'idée est de mettre un "maestro", quelqu'un de plus
balaise dans l'équipe pour créer une émulation encore une fois faire monter en
compétence le reste de l'équipe autour de lui.

## Attribution Error

- "Bidule qui est d'habitude toujours sympa, là il s'est vraiment comporté comme
  un salaud". 
- "Machin qui est d'habitude très con, là il a dit un truc super intelligent".

Ces deux phrases sont des exemples de l'attribution error. Mefiez-vous des
phrases qui contiennent _toujours_ ou _jamais_. Personne n'est toujours comme-ci
ou jamais comme-ça. Vous avez sans doute mis une étiquette sur une personne par
rapport à la manière dont elle s'est comportée la première fois que vous l'avez
rencontrée et vous avez continué à la voir de cette façon par la suite.

Oubliez vos a priori, regardez ce que font les gens maintenant, pas par rapport
à ce qu'ils ont fait avant.






Effet demo
Montrer par l'exemple
Faire les trucs chiants avec les autres

Walkman effect
aime pas les geeks, parce que geeks et gens normaux, avec casque sur les
orreilles, associaux, aiment pas les gens
remettre dans un environnement controlé, ferme les interactions

# De l'UX dans mon équipe Agile

Le role d el'ux n'est pas d'améliorer avec une checklist. on se base sur les
utilisateurs, si l'outil ne réponds au besoin des utilisaters, c'est un échec

avant, on lui demandait de faire des aquettes, presta qui deveit fare des
maquettes pendant deux mois, ave un assage sur le terrain, puis livre les
maquettes et fin du projet pour lui

maintenant chez octo
plusieurs personnes, mais pas intéressant, ce qui est interessant c'est les
fleches entre les gens, d'éhcnager, de communiquer
aller discuter avec son UX designer, s'il y en a un
demander aux développeur le type de livrable qu'ils veulent

prendre l'avance, pettes itérations, une ité d'avance mais pas plus
aide le PO à choisir les priorités en fonctoin des retours. va sur le terrain,
donne des inuts au PO
discuter avec tout le monde, management visuel
et intégrer le feedback utilisateur dans le produit le plus tot possible

appli pour conducteurs de camion citerne, trés specifique, donc aler sur le
terrain
dans le depot, demande si smatphone,. savent pas, veulent bien qu'on leur en
donne
rappellent qu'à la raffinerie, téléphone doit etre éteint pour raison de
sécurité
du coup, informations capitales sur le terrain, pour structurer l'appli. si on
prends pas ça, on fait un truc dans la mauvaise direction qu'il faut tout
changer ensuite

agir sur la storymap, changer les prios en fonction des observations. On lui
epxlique qu'ajouter les news sur la boite dan sl'appli n'interesse pas les
utilisateurs

war room, UX et développeur cote à cote, queluqes hrures, améliorent
l'intégration trés rapidement ensemble. plus gro,s contraste, couleur, etc.
permet d'échanger bien, boost dans la compréension, bypass les US, l'admin, etc
collaboration en management visuel. Il va sur le terrain, et fait des personnés
(passe de "les users" à "Marc, 45 ans, 10 ans d'experience")

tests utilisateurs dès le début du projet, permet de voir pour de vrai comment
ils utilisent. le font n'importe comment. mettre ses trippes sur la table, se
confronter au réel, voir comment on l'utilise pour de vrais

aller observer, ne pas faire avec eux, ne pas les prendre par la main, les
laisser faire. excellent

L'UX n'est pas une checklist
Échanger avec son UX designer
Challenger les maquettes
Aller Observer les utilisateurs

goodui.org

# Wild Code School
Une école de codeurs au verts
Romain Cœur
La Loupe. Eure et Loire entre Chartes et Le Mans, loin de Paris.
INgénieur, web dev.

Dernière promo finie en Avril, nouvelle en Septembre.
formarn courte et intense au dev web et mobile en 6 mois
ambitieux, mais gens ambitieux dans les profs et les élèves

5 ans d'études, appris plein de trucs. INgénieurs et Autodidactes, mais rien
entre les deux
dev web, ça se pratique de loin, pas beosin d'etre à Paris
mais toutes les écoles sont à Paris ou dans les grandes villes, vient à paris
pour faire son école, parle avec des entreprises, reste développer à Paris, pas
envie de partir en région pour le salaire

gare à la Loupe, 1h30 depuis Mparnasse, plusieurs fois par jours
promo beta, tout age, tout horizon
19 à 43 ans, milieux banque, serveur chez mac do, assistante de direction,
boulangerie, menuiserie

formation centrée sur la pratique, réalisation de projets dès la deuxième
semaine.
théorie, exo, praique, nope.
pas de cours ou presque, des hackathons au lieu des examps, des aterliers
organisés par des professionnels, coach en communication corporelle, agile,
deezer
un seul cours par semaine

exam, 24h pour faire quelque chose

Formateur, pas enseignant. Délivre as le savoir, accompagne les élèves, cohésion
d'équipe, dédramatisation de l'échec. Vrais projets, avec vrais clients et
facturés.

Temps fort

> Ce que tu dis c'est de la merde.
Alex 19 ans, serveur chez mac do, vs ex assistante de direction. Formateur, qui
doit dédramatiser et apprendre à parler de manière pro

Coups de stress/laisser-aller.
Eleves stressés, DEVAIENT réussir car reconversion et autres assistés par
papa-maman. Choisir le juste milieu entre trop compliqué et trop facile, pour
garder le flow et la motivation

Grosse erreur, un examen noté. Élèves dégoutés du système de notation de
l'éducation nationele. Pris comme une sanction, comme une attaque, pas comme un
truc à améliorer.

70% en CDD, CDI ou Stage.

Bien: autonomie, intiiave, veille
Moins bien: algo, théorie

Développer c'est bien de savoir faire, mais aussi ien de comprendre comment ça
marche.

mode d'enseignement hybride pour la prochaine formation, sorte de MOOC
+ ateliers pratiques. Explication de ce que c'est de coder, permet de voir
  eux-même si ça les intéresse ou pas, car pas d'ide de ce que c'est coder.
  Ensuite "recrutement", pour voir la motivation

Pas des ingénieurs BAC +5, développeurs qui savent s'intégrer et progresser.

Cours de code 8-10 ans, meetup découverte du code, hackathon (e-agriculture
week-end prochain), recrute formateur.

6000€, mais solution pour ceux qui peuvent pas se le permettre.

Aide du maire, internat, emploi, pépinière d'entreprise sur place.

Technos: PHP, Ruby, Node.
HTML, CSS pour les bases, en ligne. Site statique.
Choix PHP, Ruby, Node sur toute la formation.
PhoneGap, accueille tout ce qui vient des élèves.




Question: Nom de l'école. Innovéduc, Simplon Village.
Question: Langages appris, UX, Sociologie, API














