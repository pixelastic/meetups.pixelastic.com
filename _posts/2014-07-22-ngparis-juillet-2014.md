---
layout: post
title: "ngParis Juillet 2014"
tags: ngparis
---

## Introduction

Ce nouveau meetup angular avait lieu chez Sfeir, à Neuilly. Et Sfeir avait mis
le paquet. En plus de la bouteille d'eau ou de la canette de SfeirBull brandée,
on a eu le droit à un carton pour coopter un Sfeir. Même sans faire partie de
Sfeir, si on leur propose un dev et qu'ils l'embauchent, on gagne un MacBook Pro.
C'est sans doute moins cher qu'un cabinet de recrutement, mais c'est une drole
de technique.

Avant les talks, on a eu aussi droit à une petite présentation de Sfeir. 270
employés, 27 millions de CA. Basé à Paris, Strasbourg et Lille (et une 4e
ville que j'ai oublié). Les Sfeiriens sont découpés en groupe en fonction de
leurs compétences : Front, Back (Java, C#), Agile (Coach, PO), TMA, Infra. Leur
crédo est essentiellement le Front, l'Agile et le Cloud (et aussi, mais moins
primordial les technos Google et le Big Data).

Sfeir est pas mal impliqué dans les meetups parisiens, et ils sont aussi
partenaires de Google, Microsoft, Atlassian et Cloudbees (et j'ai appris que
Cloudbees était à l'origine de Jenkins).

Vu que le meetup était sur Angular, ils nous ont aussi particulièrement parlé
de leur équipe Front, qui recrute. Ils font tous les mois des genres de BBL,
une présentations suivie d'une bonne bouffe. Ils font venir des intervenants
externes pour faire monter l'équipe en compétence (Raphael Goetter est venu
présenter CSS3, et Nicolas Perriault pour CasperJS). Ils incitent à participer
aux conférences, pour y assister ou pour y parler. Ils ont deux speakers
à ParisWeb cette année, et un à ngEurope.

Mais le truc le plus intéressant sont les formations Angular qu'ils donnent,
gratuitement, à des groupes d'une douzaine d'élèves. Leur idée est qu'Angular
est une bonne techno, mais qu'il y a plein de projets Angular qui naissent, et
donc plein de projets qui vont mal se passer, parce que les développeurs
n'auront peut-être pas compris la techno et lui feront donc une mauvaise
réputation. Eux, ils souhaitent former les gens sur la techno, pour que de plus
en plus de personnes la maitrise et puissent aller comme ça polleniser les
bonnes pratiques dans les équipes et qu'ainsi le milieu du développement
Angular en France soit d'un meilleur niveau.

On sentait qu'ils cherchaient à recruter de bons devs et ils ont mis le paquet
sur les avantages à être chez Sfeir. Vu que sur les deux talks de la soirée, le
premier a été choisi par hasard deux semaines avant et le second la veille,
heureusement qu'il y a eu ce speech au départ.

Le seul bémol est le bruit incessant de singe qu'on égorge qui se faisait
entendre à chaque fois qu'une porte s'ouvrait ou se fermait.

## Nephorider : Moving a MacOS app to angular.

La première présentation était sur NephoRider, une application de visualization
d'infra cloud. J'avais déjà vu un lightning cloud à dotScale sur le sujet. Il
avait parlé des différentes API des providers clouds qui lui permettaient de
tracer cette visualization et lesquelles étaient les plus pratiques (spoiler:
celles qui permettent de faire un minimum de requetes en les aggrégeant).

Ce soir on a eu le droit à une démo rapide de l'appli, qui permet de voir sous
forme d'arbre les différentes machines du parc et leurs liaisons, si elles sont
up ou non, combien elles coutent, leurs ips, etc. L'appli de base est une appli
desktop Mac. Comme la cible sont les ingénieurs de la Silicon Valley et que
tout le monde a un MacBook là bas, c'était la solution de facilité. Ca
permettait aussi d'exporter facilement en PDF, et les machines étant standard,
on n'est pas obligé de tester trop de paramètres différents pour s'assurer la
compatibilité.

Passer en web a été un peu plus dur. Déjà au niveau du front, les services sur
lesquels ils se branchent sont peu nombreux à proposer un SDK. Et ceux qui le
font le font généralement pour des applis mobiles et pas pour du web. Par
contre, passer en web leur a permis de considérablement diminuer leur Time To
Market, en pouvant déployer une nouvelle version chaque jour sans avoir besoin
d'attendre la validation du store Apple.

On change par contre complétement d'univers. On est désormais à l'intérieur
d'un browser, on n'a plus le controle sur tous les raccourcis clavier, le
browser ayant les sien par défaut qu'on ne peut pas changer. De la même façon,
on doit se plier aux comportement attendus du browser (back, forward, refresh).

Viennent ensuite les problèmes de redimensionnement des images. Sur une appli
native Mac, c'est un faux problème car l'OS offre plein de possibilités pour
faire ça et a optimisé sa carte graphique pour ça. Dans le web, la solution la
plus proche d'un rendu desktop qu'ils ont trouvés est d'utiliser du SVG, et une
pointe de D3JS.

Tous les calculs sont relégués au back-end, le front ne s'occupant que de
l'affichage. Certains fonctionnalités sont même complétement executées en
backend (comme l'export en pdf par exemple).

Finalement, pourquoi a-t'il choisi Angular ? Et bien un peu par hasard. Il
a choisit à un instant donné le framework qui était le plus populaire. Il n'y
connaissait pas grand chose en front, mais n'a finalement pas été déçu. Son
retour d'expérience est que les Controllers d'Angular sont assez proches de son
code Cocoa, il a quasiement juste eu à copier-coller le code d'un langage
à l'autre, modifier quelques itérateurs et quelques éléments de syntaxe mais la
majorité était déjà faite.

Pour les directives par contre, il tient le même discours qu'un peu tout le
monde : c'est très compliqué. On peut leur faire faire des composants simples
et modulaires comme on peut en faire un système complexe de gestion de template
et de fenetres (ce qu'il a fait).

Pour lui la courbe d'apprentissage d'Angular est très forte. Même en utilisant
des projets de bootstrapping comme `angular-seed` ou `yeoman` c'est beaucoup
de choses à ingurgiter en une seule fois. Sans parler des `npm` et `bower`.
Quand on vient du monde du dev Mac où on ne doit supporter qu'une version, deux
maximum, toute cette histoire de gestionnaire de dépendances et de version lui
semblait overkill.

Il a pas mal buté sur les paradigmes différents entre une appli Desktop et une
appli web, ou sur des fonctionnements similaires qui portaient des noms
différents, ou au contraire des comportement différents qui portaient le même
nom dans les deux univers.

Chose qui m'a surprise, il utilise abondamment `$watch` dans son appli, comme
élément fondateur pour faire communiquer les différentes parties, de la plus
haute à la plus basse.

Finalement quand on lui demande s'il a des tests automatisés d'IHM dans son
appli il réponds que non. Que pour lui le meilleur test est celui que tu fais
à la main, ou par un réel utilisateur. Il pense que c'est de son temps passé
chez Apple, ou l'UX a beaucoup d'importance, c'est quelque chose qui se ressent
en le faisant, qu'on ne peut pas abstraire dans un test. Il ajoute aussi que
quelque soit le harnais de test que tu mettes en place, quand tu passera ton
appli à un utilisateur lambda il va te remonter des bugs que tu n'aurais jamais
pu imaginer.

## Angular UI

Le second talk n'a failli pas avoir lieu. Douglas Duteil, développeur chez
Sfeir nous parle des animations dans angular. Il doit présenter ce talk
à ngEurope et donc ça lui permettait de faire une petite répétition. Mais
finalement il semblerait que le core commiter d'Angular qui se spécialise sur
les animations fasse aussi une présentation sur les animations, du coup Douglas
va devoir sans doute trouver un autre sujet.

Bref, revenons à nos animations et à un problème que je n'imaginais pas.
Angular peut gérer des animations, par exemple pour faire apparaitre ou
disparaitre un élément avec un bel effet de fondu. Oui mais si on lie cela au
two-way binding et à `ng-if`, comment est-ce que ça marche ? Notre élément doit
disparaitre quand la valeur testée devient fausse, mais si on y a mis une
animation ça veut dire qu'il y a donc une différence entre l'état de notre
application (sous forme de data) et son état visuel. L'animation peut prendre
une seconde à s'effectuer alors que notre variable est bien devenue `false`. Du
coup la vue ne représente pas exactement le modèle. Et que faire si elle
redevient `true` alors que l'animation pour la faire disparaitre n'a pas
terminé de se jouer ?

Comme dans un bon polar, Douglas nous laisse sur nos questions pour partir dans
une autre direction. Il nous parle de la Web Animation API, un spec en cours
sur les animations qui semble lui donner des étoiles dans les yeux. Elle a pour
but d'uniformiser sous une API commune les animations CSS, Javascript et même
canvas. Elle permettra d'exposer un objet normalisé représentant l'horloge
d'une animation. Cet objet étant passé en paramètre aux fonctions appellées
à chaque tick des animations, ce qui permettra de savoir exactement où on en
est dans l'animation et de pouvoir influer directement dessus, voir d'influer
sur d'autres animations dans la page.

Douglas avait travaillé sur un projet perso nommé `WAaA` pour Web Animation and
Angular qui devait permettre de porter cette API dans les browsers qui ne
l'implémentent pas et plus particulièrement de remplacer `ng-animate` par ce
polymer. Le projet n'a pas trop évolué, les performances étant assez mauvaises.
Et la team officielle Angular n'avait pas l'air trop motivée pour l'utiliser,
leur argument étant que la spec allait arriver officiellement dans les browser
plus tard.

Et c'est effectivement le cas car Chrome 36 incorpore la Web Animation API !









