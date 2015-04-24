---
layout: post
title: "HumanTalks Avril 2015"
tags: humantalks
---

Pour la session d'Avril, les [HumanTalks][1] avaient lieu chez [Meetic][2].
Meetic en a profité pour nous faire une petite présentation de l'historique de
la boite.  Ils sont aujourd'hui dans la position de la startup qui a grandit
très vite, qui a racheté plusieurs autres boites et qui se retrouve très
rapidement avec un legacy et un SI complexe. Ils sont aujourd'hui dans une
phase de simplification, à base d'architecture REST, d'industrialisation, de
TDD, de BDD, un peu de [Docker][3] dans un coin, et plein de choses
intéressantes.

Ils sortent aussi progressivement du travail avec les prestataires qui ont
anciennement développé leurs applications pour les internaliser aujourd'hui, et
redonner un coup de jeune à leur présence en web mobile, puis sur le desktop.
Ils ont des concurrents beaucoup plus hypes avec [Tinder][4] et [Happn][5] et
veulent rester à la page.

Après cette petite entrée en matière et après la présentation des HumanTalks,
on est partis sur les talks.

## L'UX n'est pas là où vous le pensez

On commence par le talk le moins technique de la soirée, plutôt porté sur l'UX
pour débutants. [Christophe Michel][6], d'[Arolla][7] nous raconte une petite
histoire de toilettes d'une grande banque française noire et rouge.

![UX][8]

Les toilettes sont un lieu exclusivement utilitaire, on y va parce qu'on
a besoin d'y aller, et on n'y va que pour une seule chose. C'est donc un très
bon endroit pour s'entrainer à faire de l'ergonomie.

Malheureusement, les toilettes dont il nous parle semblent avoir été fait en
dépit du bon sens. Les portes ne peuvent pas s'ouvrir complètement car elles
tapent contre la céramique des toilettes, obligeant les gens à se contorsionner
pour entrer ou sortir. Les pictogrammes sur les portes censés indiquer si ce
sont des toilettes homme ou femme sont peu clairs, et il a fallu rajouter une
indication au marqueur pour réussir à faire la différence. Une fois toutes ces
épreuves terminées, on doit encore se battre avec les lavabos dont la vasque
hyper-profonde se voit affublée de robinets qui coulent au ras des bords et
d'une sèche-main "automatique" qui ne se mets jamais en marche.

Bref, tout cette introduction permettait de mettre en valeur le fait que les
personnes ayant construit ces lieux ne se sont jamais mis dans la peau des
utilisateurs. Tout cela sent bon le cahier des charges suivi à la lettre, sans
réfléchir à l'utilisation réelle des personnes finales.

Et cela fait un bon parallèle avec le développement des applications. Bien
souvent, quand on développe et qu'on reste focus sur les fonctionnalités
à ajouter, on ne pense pas à l'utilisateur final. On va mettre des menus
déroulants de 125 entrées pour choisir un pays même si 99% de nos utilisateurs
seront en France. Et déjà ça, c'est mieux que de demander aux users
d'entrer eux-mêmes l'id du pays dans un champ libre...

On utilise aussi des messages de confirmation cryptiques, du genre "_Êtes-vous
sur de ne pas vouloir annuler votre action ? Oui. Non. Annuler_". Dans ces cas
là, un messages reformulé et surtout des boutons plus explicites permettent de
lever les ambigüités.

Finalement, le talk mettant en garde les développeurs sur la facilité que l'on
peut avoir à choisir la solution techniquement la plus simple, et celle que
l'on sait utiliser avec notre background, mais qui n'est généralement pas la
plus évidente pour l'utilisateur final. 

Je regrette un peu que le talk n'est pas donné plus de pistes d'améliorations
(faut-il intégrer un ergonome à part entière dans l'équipe, si oui à quel
moment ? Au début, tout le long, à la fin ? Ou bien est-ce un travail qui doit
être dilué dans toute l'équipe). Je reste un peu sur ma faim, mais c'est une
piqure de rappel bienvenue.

Dans les commentaires de la page meetup, Christophe a donné pas mal d'idées de
lecture pour creuser plus profondément :

- [The Design of Everyday Things][9]
- [About Face: The Essentials of Interaction Design](http://www.amazon.fr/About-Face-Essentials-Interaction-Design/dp/1118766571)
- [Don't Make Me Think][10]

## Famo.us / Angular

On a ensuite enchainé sur le talk de Jean-Christophe Honde de Meetic, qui
travaille justement dans l'équipe de refonte de l'appli mobile. _Full
disclosure: je viens de passer les 6 derniers mois dans cette équipe, donc le
sujet m'étais très familier._

JC a orienté son talk non pas sur les spécificités de la refonte Meetic mais
sur le choix de la technologie pour le faire. Ils sont partis sur [famous][11],
un framework d'animations JavaScript dont la promesse est de délivrer des
performances aussi bonnes sur tous les devices, même les plus vieillissants.

Il explique comment et pourquoi ils ont fait ce choix. Pour lui, une
technologie est viable en entreprise si elle corresponds aux trois critères
suivantes : le code est testable, la communauté est active, et elle apporte
quelque chose d'innovant.

Il est inutile de rappeler pourquoi les tests sont exceptionnellement
importants (réduit le cout de devs, évite les non-régressions, fait office de
documentation, etc), et on va surtout parler des deux suivants. Une communauté
active permet de s'assurer que la techno sera maintenue pendant plusieurs
années, et le coté innovant permet à la société qui l'utilise d'avoir un
avantage face à ses concurrents.

L'appli n'est pas entièrement bâtie sur famous, il y a aussi un socle en
[Angular][12], mais là n'était pas le sujet du talk donc on est passé vite les
classiques reproches qui lui sont fait.

Pour JC, la promesse de famous est de réussir là où HTML5 a échoué. C'est
à dire que les specs HTML5 promettent monts et merveilles en terme d'animation,
mais le support est encore fragmentaire, parfois inexistant ou beaucoup trop
lent sur de vieux devices. Famous quand à lui se pose comme une couche
JavaScript sur les propriétés CSS 3D Transform. Ces propriétés utilisent la
puissance du GPU des devices de manière à utiliser au maximum les possibilités
du téléphone, et l'abstraction Famous permet de simplifier leur écriture.

Et ça marche. Famous utilise en partie le DOM HTML classique, mais place tout
ses éléments en `position:absolute` dans un viewport de taille fixe et les
anime en CSS. Des tas de démos du framework permettent de s'en rendre compte,
tout s'anime dans tous les sens, comme cette [table périodique des éléments en
3D][13].

Sauf que ce que Famous ne fait pas, ce sont les éléments de UI. La librairie ne
fournit pas, ou très peu, d'éléments permettant de créer un UI facilement
(comme peut le faire [Ionic][14] par exemple). Il faut donc récréer soi-même
toute cette partie. Au final, on résout effectivement le problème de
performance, mais au prix d'un plus long développement pour refaire ce que HTML
nous offrait nativement (un peu comme [Flipboard et leur surutilisation du
canvas][15].

Si on rajoute à cela que Famous et Angular on des cycles de digest différents
et qu'il faut réussir à synchroniser les deux, on rajoute une complexité
supplémentaire. 

Au final, des dires mêmes de JC, Famous ça marche, mais c'est compliqué. Il
faut vraiment vouloir se plonger dedans et avoir un vrai besoin de perfs pour
que cela vaille le coup. C'est couteux, mais c'est aujourd'hui d'après lui le
seul moyen sur le marché.

Au final, j'en ressors en me disant que c'est une techno puissante, mais que
j'utiliserais plutôt pour des animations 3D et pas pour de la UI (à moins
d'avoir un vrai prérequis de support de vieux devices comme Meetic). 

## Google Guice

Pour le 3e talk, [Pauline Iogna][16] nous a parlé d'injection de dépendances
avec [Google Guice][17].

Son talk était fait comme un cours didactique où on commençait avec un code
dont les responsabilités étaient très couplées. Une méthode instanciait un
nouvel objet avant de le manipuler, ce qui rendait le tout difficilement
testable (car difficile à mocker).

Elle a petit à petit transformé le code en inversant les concerns, et en
ajoutant Google Guice dans l'histoire. À noter que l'exemple était évidemment
donné en Java (Google Guice étant un framework d'injection de dépendance pour
Java), et n'ayant jamais fait de Java, j'ai décroché en cours de route.
Malheureusement, ses slides avaient peu de contraste de couleur et environ la
moitié de la salle ne pouvait pas lire ses exemples.

J'ai quand même réussi à comprendre qu'une force de Guice était de permettre
d'insérer des annotations au dessus de ses méthodes pour indiquer comment
l'injection de dépendance devait se faire, ce qui permettait de garder un code
simple mais explicite.

Au final, j'ai apprécié la démarche de refacto pas à pas (cela m'a fait penser
à un chapitre de [Practical Object-Oriented Design in Ruby][18] de [Sandi
Metz][19] où elle explique aussi par l'exemple comment inverser les contrôles.

## Vim, il y a encore des gens qui codent avec ça en 2015 ?

J'ai ensuite donné la dernière présentation, sur vim, mon éditeur de tous les
jours. Il est assez difficile de faire un récapitulatif de ce qu'est vim et
surtout de donner envie d'essayer en 10mn, mais j'ai réussi à aborder la
majorité des sujets qui me semblaient importants.

Vous pouvez trouver les [slides ici][20], mais j'ai avant tout parlé du fait
que pour nous autres développeurs, notre éditeur de code est notre outil le
plus important. On passe des heures devant jour après jour et année après
année, il faut donc que cet outil nous fasse gagner du temps et que ce soit un
plaisir de l'utiliser. C'est notre éditeur qui doit se plier à nous et non pas
l'inverse.

Je n'ai pas souhaité lancer un troll entre vim, emacs, [IntelliJ][21],
[Sublime][22] et tous les bons éditeurs qui existent, j'ai simplement parlé de
celui que j'utilise et de pourquoi je l'apprécie.

Les avantages principaux de vim découlent tous du fait que c'est un éditeur en
mode console. Une fois qu'on a lancé vim, on reste dans sa console et on fait
tout au clavier. Vim est pensé comme ça, du coup, tout est pensé pour être fait
sans souris, et cela va beaucoup plus vite une fois qu'on connait les touches.
Ça permet aussi d'éviter de se faire mal aux avant-bras à force d'aller
chercher sa souris sur la table et de se cogner le bras sur le rebords de la
table, jour après jour, de manière répétées, pendant des années.

Vim fonctionne en deux modes principaux : le mode normal et le mode insert. Le
mode insert est celui que tous les autres éditeurs appellent le mode normal: on
appuie sur une touche, cette lettre s'affiche à l'écran. Pour vim en mode
normal, quand on appuie sur une suite de touches, notre code en est modifié. On
peut se déplacer comme ça dans le fichier, déplacer des lignes ou des mots,
changer des arguments, faire des copié-collé.

Pour la petite histoire, j'avais assisté à un ParisJS il y a quelques années où
Ryan Dahl, le créateur de [nodejs][23] était venu présenter son bébé. Il avait
fait une séance de live coding avec vim et j'avais été bien plus ébahi par vim
que par nodejs à l'époque. Le code semblait se créer sous mes yeux sans que je
comprenne comment il avait fait. Et c'est une force de vim que je retrouve
aujourd'hui, maintenant que je connais les commandes principales. La barrière
entre le moment où j'ai une idée dans la tête et celle où mon code est modifié
pour refléter cette idée est de plus en plus courte, ce qui me permets de
rester _in the zone_.

J'ai finalement terminé en donnant plusieurs exemples de ce en quoi vim était
customisable : macros, plugins, remapping de touches, appel à la ligne de
commande, etc.

L'exercice était difficile, mais plusieurs personnes m'ont ensuite dit avoir
envie d'essayer, je suis donc satisfait :). Si vous voulez jeter un œil à ma
config vim, c'est [par ici que ça se passe][24].


## Conclusion

Meetic nous a ensuite régalé avec d'excellents bagels et cookies (quantités
telles qu'on avait encore de quoi manger le lendemain midi) et les
discussions/trolls ont pu continuer sereinement dans la cafétéria.

Le mois prochain, les HumanTalks se passent chez Deezer, venez nombreux !


[1]: http://www.meetup.com/HumanTalks-Paris/events/221499748/
[2]: http://www.meetic.com/
[3]: https://www.docker.com/
[4]: http://www.gotinder.com/
[5]: https://www.happn.fr/fr/
[6]: https://twitter.com/christopheml
[7]: http://www.arolla.fr/
[8]: /img/2015-04-14/humantalks.jpg
[9]: http://www.amazon.com/Design-Everyday-Things-Donald-Norman/dp/1452654123
[10]: http://www.amazon.fr/Dont-magke-thingk-Steve-Krug/dp/2744025526
[11]: https://famo.us/
[12]: https://angularjs.org/
[13]: http://disrupt.famo.us/periodic402/
[14]: http://ionicframework.com/
[15]: http://engineering.flipboard.com/2015/02/mobile-web/)
[16]: https://twitter.com/pauline_io
[17]: https://github.com/google/guice/
[18]: http://www.poodr.com/
[19]: http://www.sandimetz.com/
[20]: http://talks.pixelastic.com/vim-humantalks/#1
[21]: https://www.jetbrains.com/idea/
[22]: http://www.sublimetext.com/
[23]: https://nodejs.org/
[24]: https://github.com/pixelastic/oroshi/blob/master/config/vim/vimrc
