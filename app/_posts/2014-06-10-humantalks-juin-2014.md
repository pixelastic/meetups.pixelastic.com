---
layout: post
title: 'HumanTalks Juin 2014'
tags: humantalks
---

## Introduction

Mardi dernier avait lieu les HumanTalks. Cette fois-ci c'était dans les locaux
de So@t, et c'était sur le thème des jeux vidéos.

Au menu, on a eu 5 présentations :

- Board Game Arena, un site communautaire pour jouer à des jeux de plateau en
  temps réel, et explication de la stack technique derrière (Jetty, Apache,
  PHP, long-polling)
- Overview de ce qu'est la gamification, et comment ça marche.
- Présentation de Gosu, une librairie Ruby pour faire des jeux vidéos en 2D
  très facilement.
- Les Agile Games, et en quoi jouer stimule des parties spéciales du cerveau et
  peut aider à l'innovation, le cohésion de groupe et l'empathie.
- Et finalement, retour d'expérience d'un game designer de chez Quantic Dream,
  et comment se passe les cycles de développement d'un AAA vu de l'intérieur.

## BoardGameArena

{% youtube https://www.youtube.com/watch?v=gCotCm5qYmE %}

Gregory Isabelli (@boardgamearena), nous parle de [Board Game
Arena](http://fr.boardgamearena.com), un site où il est possible de jouer en
temps réel avec d'autres joueurs à des jeux de plateaux.

Le tout est (bizarrement) codé en PHP, avec un Apache devant, et des
connections avec le serveur en long-polling. Derrière ces choix étranges, il
faut savoir que le site a déjà près de 6 ans d'existence si je me souviens
bien, et que c'était pas un si mauvais choix de stack à l'époque.

Le paradigme classique du web (le client initialise une requete, le serveur
l'attrape et réponds) n'est pas possible pour faire du temps réel, vu qu'il
faut que le serveur puisse notifier ses clients quand une nouvelle action se
passe (classiquement, quand un autre joueur à fini son tour).

Il utilisent donc un serveur jetty devant leur apache pour gérer le
long-polling. Pour ceux qui ne sont pas familiers avec la technique, le
long-polling consiste à ce que le serveur prenne le plus de temps possible pour
répondre (mais sans timeout). Le client envoie une requete, et si le serveur
n'a rien à répondre, il maintient la requete ouverte. Si jamais il est notifié
d'un event en interne, il ferme la requete en envoyant le résultat de cet
event, et le client renvoie aussitot une nouvelle requete. Si jamais il n'y
a pas eu d'event, le serveur renvoie quand même une réponse pour éviter le
timeout, et le client relance une requete.

Comment ça se passe par derrière en PHP ? Et bien, quand un joueur A envoie ses
ordres, le serveur s'occupe de calculer le nouvel état du plateau de jeu. Il
notifie ensuite le serveur jetty avec le nouvel état, et celui-ci ferme toutes
les requetes ouvertes de tous les joueurs avec ces nouvelles informations (qui
en ouvrent à nouveau de nouvelles automatiquement).

Sur boardgamearena, ils ont en moyenne 1000 joueurs connectés tous les soirs,
et leur unique serveur jetty tient tout à fait la charge. Néanmoins, ils savent
que s'ils doivent scaler pour accueillir plus de joueurs, il leur suffit de
rajouter de nouveaux serveurs jetty (environ 1 pour 20.000 joueurs) et de
modifier le PHP pour qu'il notifie plusieurs jetty à la place d'un seul.

Étant moi-même grand joueur de jeux de plateaux, j'ai beaucoup aimé ce site,
que je ne connaissais pas. Ils proposent aussi un mode "studio", dispo
directement dans le navigateur pour coder ses propres jeux.

## La Gamification, qu'est-ce que c'est ?

{% youtube https://www.youtube.com/watch?v=0z2kyjie3LU %}

David Grezinger, développeur chez Xebia, qui nous avait déjà fait une
présentation sur les MOOCS à un précédent HumanTalks, nous a cette fois parlé
de la Gamification (sujet qu'il a appris grâce à Coursera).

Il nous a d'abord parlé du but de la gamification, qui peut être d'attirer
des utilisateurs sur une plateforme, ou de favoriser le travail en équipe. Pour
cela on utilise une mécanique de points, de badges, de barres de progressions,
qui peut être plus ou moins subtile. Foursquare est un exemple de Gamification
assumée et très flagrante, idem pour les badges sur CodeSchool. Les barres de
progression quand on rempli son profil sur LinkedIn par exemple en est un autre
exemple. StackOverflow finalement est un exemple un peu plus subtil.

Mais il ne suffit pas de rajouter des points ou de badges pour avoir une
gamification réussie. Le but est de réussir à recréer des mécanismes qui nous
paraissent ludiques, amusants, et qui incitent, sans qu'on le remarque, à faire
des tâches qui nous auraient sinon semblées rébarbatives. Il existe des
applications de fitness qui poussent la gamification très loin, en simulant un
mode envahi de zombis, en faisant appel à un savant mélange de carte google
maps et à l'imagination de l'utilisateur pour le forcer à courir d'un point
à l'autre de sa ville pour "éviter les zombis".

Il a fini par faire un parallele avec World of Warcraft, où pour réussir
à battre l'un des boss les plus difficiles du jeu, il fallait à une époque
réussir à regrouper une équipe de 40 joueurs différents, avec des classe de
personnages (et donc des roles) complétement différents. Réussir à la
coordonner, plusieurs fois par semaine, pendant des mois, échec après échec,
pour finalement réussir à battre ce satané Ragnaros. Essayez donc de faire la même
chose en entreprise, coordonner 40 personnes, à distance, avec des compétences
et des égos complétement différents, pour atteindre un but commun, échec après
échec.

Ceci n'est qu'un résumé de son talk qui était lui-même un résumé du cours de
Kevin Werbach sur Coursera, donc si vous voulez creuser le sujet, je vous
invite à aller directement à la source.

## Faire des jeux en Ruby avec Gosu

{% youtube https://www.youtube.com/watch?v=0ckw7sxiGoQ %}

Matthieu Segret, co-fondateur des HumanCoders nous a fait une présentation sur
Ruby, et plus particulièrement Gosu. Gosu en Ruby est simplement une interface
qui se bind sur une library en C qui permet de créer facilement des jeux 2D. 

C'est cross-platform, ça permet de générer une fenetre dans l'OS, avec un
background, des sprites, et une boucle de jeu qui écoute les événements
clavier.

Lors de ses formations d'initiation à Ruby, c'est cette library qu'il utilise
pour apprendre Ruby a des débutants, parce que le feedback visuel est
instantané et le code est facile à lire et à écrire.

Je ne vais pas trop m'étendre dessus, vu qu'il l'avait déjà présenté à un
parisRB, il vous suffira de retrouver le compte-rendu initial. 

## Agile Games

{% youtube https://www.youtube.com/watch?v=q5tbKFJcOnw %}

Talk présenté par un formateur agile de So@t dont j'ai malheureusement oublié
le nom. Il nous a parlé du jeu comme mécanisme d'amélioration, d'innovation et
d'estimation.

Jouer permet de manipuler des concepts de manière plus forte que de simplement
les lire ou les écouter, cela permet de se les approprier avec plus de force,
d'en devenir utilisateur et non plus seulement spectateur. Cela permet aussi de
créer des liens entre des personnes, une synergie, une empathie qui n'est pas
forcément créée naturellement dans un contexte d'équipe traditionnel.

Selon lui, on retient plus facilement une leçon quand elle est liée à une
émotion forte, et comme il ne peut pas taper sur ses élèves, il préfère les
rendre contents, par le jeu.

D'un point de vue purement neurologique, ce ne sont pas les mêmes zones du
cerveau qui sont sollicités quand on réfléchit à un problème que quand on
manipule physiquement des objets. On peut ainsi faire sortir des idées qui ne
seraient pas venues si on s'était simplement limité à réfléchir au sujet. C'est
simplement humain.

Il a ensuite donné plusieurs exemples de jeux agile qu'il utilise. La product
box, qui consiste à essayer de construire la "boite" de notre produit si
celui-ci pouvait simplement être vendu en supermarché et que l'acheter
suffisait à résoudre les problèmes qu'il est censé résoudre. On réfléchit donc
à mettre en avant ce à quoi le produit doit servir. Le cadrer dans un exemple
concret auquel on est habitué, peut permettre de plus facilement s'approprier
l'exercice. Cela permet aussi de discuter sur ce qu'il est nécessaire de mettre
en avant sur le produit, et de potentiellement voire les différences de
perception entre les personnes sur ce qui est important. La place sur la boite
étant limitée, on doit se concentrer sur le plus important.

Il a ensuite présenté des estimation games. Partant du principe que c'est aux
développeur d'estimer eux-même la durée de leur charge de travail et non pas
à leur boss, que l'intelligence collective permettrait un meilleur chiffrage
que l'estimation individuelle. Il nous a donc présenté le planning poker,
rajoutant que l'esprit humain est facilement capable de faire des comparaison
(machin est plus grand que bidule) que de donner des chiffres exacts (machin
mesure 1m82). La suite de Fibonnacci est donc parfaitement adaptée pour ça.

Il a ensuite donné l'url du site tastycupcakes.com pour trouver des idées de
jeux agiles, et a annoncé qu'ils avaient développés en interne à So@t un Kaizen
Game, permettant d'aider l'amélioration continue, et qu'ils le présenteraient
à un meetup prochainement.

Bonnes idées, même si je pense qu'on utilise un peu les mêmes techniques
à Octo, je n'en ai jamais utilisé personnellement, et j'ai aimé avoir des
arguments (neurologiques) sur en quoi c'est intéressant, et que ce n'est pas
simplement parce que c'est plus fun.

## La création d'un AAA

{% youtube https://www.youtube.com/watch?v=CxtnIa2ss50 %}

Alexis Moroz nous parle de son parcours de game designer dans plusieurs boites
de jeu vidéo français. Il a surtout parlé de son travail sur Heavy Rain, chez
Quantic Dream vu que c'est là qu'il a passé le plus de temps.

Quantic a 17 ans d'existence, et 5 jeux produits. Ils sont spécialisés dans les
"Interactive Drama", un genre qu'ils ont inventés, genre de films interactifs,
avec beaucoup d'émotion, mais que beaucoup de gens qualifient comme "n'étant
pas des jeux".

La production d'un jeu AAA comme Heavy Rain a couté environ $20 millions de
dollar, plus environ $30 millions de marketing. Au final, le jeu aura rapporté
$113 millions. Aux dires d'Alexis, Heavy Rain n'était pas vraiment un "triple
A", mais plutot un "2.5 A", car depuis des jeux comme les Assassin's Creed ou
GTA ont complétement réhaussé le budget nécessaire à la conception des jeux. On
dépasse aujourd'hui les budgets des blockbusters de cinéma.

Le rythme de développement d'un jeu de ce genre est très différent de ce à quoi
nous sommes normalement habitué dans les projets informatiques. Tout est drivé
par les milestones : pré-alpha, alpha, pré-beta, beta, release candidate et
gold. Les dates de ces milestones sont fixées à l'avance et coincident avec des
événements majeurs du milieu (E3, TGS, etc). Il n'est donc pas possible de les
déplacer, une version du jeu doit être sortie à cette date, quoiqu'il arrive.

En plus de cela, les budgets pour les jeux étant colossaux, Quantic ne peut pas
investir sur ses propres fonds. C'est donc le travail de l'éditeur, dans leur
cas, Sony. Ils passent un contrat avec Sony, où Sony s'engage à payer leurs
dépenses (locaux, salaires, etc) jusqu'à la prochaine milestone, et eux
s'engagent à un certain nombre de features qui doivent apparaitre dans cette
milestone. S'ils ne remplissent pas leur part du contrat, alors Sony ne remplit
pas la sienne non plus. C'est à dire qu'ils ne sont pas payés, et que donc des
jeux peuvent ne jamais voir le jour si une des milestone n'a pas été atteinte.

Il n'est pas possible de négocier sur les délais comme on l'a vu, et très
difficile de négocier sur le périmètre, Quantic s'engageant sur celui-ci au
début. Néanmoins, Alexis nous avoue que généralement on triche sur les
specifications. Si on a dit qu'un niveau entier doit etre jouable, ou que tous
les personnages doivent être texturés pour une étape donné, on ne fait quand
même que le minimum pour ce qui n'est pas indispensable. Niveau vide à part
pour l'intrigue principale, textures de basse qualité pour les endroits
éloignés, etc.

Du coup, si ni les délais ni le périmètre ne peuvent bouger, qu'advient-il de
la qualité ? Et bien c'est là que tout est subjectifs. Chez Quantic, les jeux
jouant beaucoup sur l'émotion, les tests des niveaux sont effectués par des
humains, qui jouent et rejouent, et des playtesteurs externes. Il n'ont que
très peu de tests automatisés, voire pas du tout. Ils ont de grandes sessions
de QA, mais faites par des humains (un chèque cadeau de 100€ contre 3-4h de
test d'un niveau).

Quantic, et Ubisoft, et finalement pas mal des grosses boites de jeu sont
connues pour avoir des rythmes de développement effrenés quand les dates de
milestone approchent, surtout quand la dernière arrive. Ils savent qu'après la
date finale, ils ne pourront plus rajouter de contenu sur leur jeu, et ils
y ont travaillé des années, par passion, ils ont envie qu'il soit parfait. Et
comme ils sont aussi généralement en retard des milestones précédentes pour
avoir grapillé sur les specs, ils ont beaucoup de travail à faire à la fin. Ces
periodes de burn sont très durs, et il est fréquent que des démissions arrivent
à la pelle après ces périodes, qui en dégoutent plus d'un de travailler dans ce
milieu.

Les salaires ne sont pas mirobolants non plus, les boites jouant beaucoup sur
le fait que "mais tu viens faire ta passion, travailler dans le jeu vidéo c'est
pas donné à tout le monde, si tu ne veux pas de ce poste, je vais en trouver
facilement d'autres, tu devrais être content."

Ce qu'il est intéressant de noter sur la composition des équipes, c'est qu'il
y a autant de développeurs (une vingtaine chez Quantic en tout cas) pour la
conception du moteur de jeu en lui même que pour la conception des outils
internes (outils pour importer les textures, gérer les modèles 3D, gérer le
motion capture, etc).

Finalement dernière point intéressant pour revenir sur les différentes
milestones, c'est que généralement les deux premières (pre-alpha, alpha)
contiennent surtout des artworks et pas de phase de jeu, puis vient la
"vertical slice", qui est censé donner une vue d'ensemble d'un niveau du jeu.
Avec la musique, les effets, le scénar, le moteur 3D, etc. Bref, toutes les
couches du jeu sont présentes, mais sur une durée limitée. Ce genre de
production peut difficilement être réutilisée dans le projet final, et c'est
donc finalement du temps "perdu" en développement, mais gagné pour le coté
marketing.
