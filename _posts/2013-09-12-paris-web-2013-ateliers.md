---
layout: post
title: Paris Web 2013
tags: parisweb
---

## Introduction

Le samedi, après les conférences Paris Web, c'est toujours les ateliers. Je
conseille à tout le monde d'aller aux ateliers. Même si vous ne venez pas aux
conférences, les ateliers sont toujours très instructifs et surtout, c'est
vraiment pas cher.

Ce sont des cours moins théoriques et plus pratiques, par petits groupes, et
avec une plus forte intéraction avec le speaker.

## Apprendre à se servir des Chrome Dev Tools

Thomas Bassetto nous parle des fuites mémoires et de comment on peut les
débusquer et les corriger avec les Chrome Dev Tools. Le principe même d'une
fuite mémoire, c'est qu'elle n'apparait pas dès le début mais seulement quand
on laisse tourner son application pendant un certain temps d'utilisation.

A la fois Chrome Canary et les Nightlies de Firefox proposent des outils de
profiling très utiles pour les trouver. Les versions ne sont pas toujours
stables, mais elles sont excellent pour débugguer.

Pour Chrome, il est conseillé de se créer un nouveau profil pour débugguer.
Pour repartir comme ça sur une base clean, sans extensions, sans cache, sans
historique, etc. Idem sous Firefox.

Safari sous Mac a longtemps était une copie-conforme de Chrome, mais
aujourd'hui les deux sont bien différents et les outils de débugging de Safari
sont très mauvais. À la place, il est conseillé sous Mac d'utliser WebKit.app.

Sous Windows 8.1, les outils de debug de IE11 sont très bon aussi. Si vous
devez débugguer d'anciennes versions de IE, c'est une autre histoire...

Thomas nous présente ensuite quelques raccourcis bien utiles et pas forcément
connus de l'outil. En sélectionnant un nœud et en appuyant sur `h`, on le
masque, `suppr` le supprime du DOM (et on peut l'annuler avec `Ctrl-Z`). Il est
aussi possible de déplacer des nœuds du DOM simplement en faisant un
drag'n'drop.

Dans la colonne de droite, on peut aussi forcer les états `:hover`, `:active`
et `:focus`. Il est possible d'incrémenter les unités CSS en appuyant sur
Haut/Bas (en ajoutant `Ctrl` ou `Maj` on augmente aussi l'incrément).

Il nous a aussi parlé des fonctions avancées de logging comme `console.group`,
`console.groupEnd`, `console.time` et `console.timeEnd`. Malheureusement, je ne
me souviens plus ce qu'elles font...

Il existe de plus des tas d'extensions pour Chrome et Firefox qui ajoutent des
fonctionnalités spécifiques pour certains frameworks, comme Ember, Angular,
Knockout ou Backbone.

Avec les Chrome Workspaces, on peut même en partie remplacer son IDE. Il est
possible de modifier le CSS directement depuis le browser, puis de voir les
fichiers modifiés, avec le diff par rapport aux fichiers source. Chrome est
même capable d'exporter les fichiers ainsi modifiés pour remplacer les fichiers
existants. Ca ne marche par contre pas encore avec les préprocesseurs.

Ces outils proposent plein de petites choses pour rendre la vie du développeur
plus facile. Ils ont des fonctionnalités de prettyprint du code (pour indenter
correctement un fichier minifié par exemple). Parfois, ces options sont un peu
cachées, mais elles existent. Ils proposent aussi bien souvent l'objet `$` qui
permet de faire des sélections CSS à la jQuery. Si jQuery est chargé alors il
l'utilise, sinon il se rabat sur les méthodes natives.

Thomas nous a aussi montré des trucs plus puissants comme des breakpoints en
CSS pour voir quand une propriété est modifiée, et par qui (feuille de style,
script ?). Je ne me souviens plus de la manip, mais ça m'avait bluffé.

Finalement la dernière feature intéressante sont les possibilités de timeline.
On peut voir en temps réel les reflow et les repaints. Ca permet de voir où
l'affichage de l'UI prends du temps. A savoir que chaque browser possède ses
propres routines pour l'affichage et que donc Firefox et Chrome ne ralentiront
pas forcément sur les mêmes choses.

Il est possible de voir le fps général, et donc de détecter ce qui le fait
baisser (peut-être un évenement un peu trop poussif bindé sur un `onscroll` ?).
Il est possible de zoomer sur un moment de la timeline en le selectionnant pour
aller voir plus profondément, et à partir de là remonter les stacktrace pour
voir ce qui a appellé les redraw.

L'outil est vraiment super puissant et je ne me doutais pas qu'il permettait
autant. Il est par contre assez complexe à prendre en main, car les
fonctionnalités sont légions et parfois cachées.

Thomas a finalement terminé en nous donnant quelques astuces qu'il a apprise au
fil de ses débugs. Déjà, le trick d'utiliser `-webkit-transform:translateZ(0)`
sur une animation permet de la faire traiter par le gpu plutot que le cpu.
Utiliser un `background-fixed` sur le body permet d'économiser des repaints.
Désactiver les effets de survol quand on scroll est aussi une très bonne idée.
Pour ça on peut ajouter par défaut une classe sur le body, qu'on supprime quand
on scroll et on n'active les effets `:hover` que si cette classe est présente.

Finalement il nous a montré les Heap Snapshot de Chrome qui permettent de
prendre un snapshot de la mémoire à un moment donné. Vu que ça prends
absolument tout en compte il est parfois difficile d'y trouver ce qu'on
cherche. Son astuce est de prendre un premier snapshot, puis de faire X fois la
même action, qu'il suppose être la cause du problème, puis de reprendre un
autre snapshot. Puis il compare les deux, et regarde dans le diffs ceux qui
sont multiples de X. Par entropie il a trouvé que `X = 7` était un bon chiffre,
qui est assez grand pour sortir du lot et assez petit pour ne pas prendre trop
de temps. Et surtout, c'est un nombre premier, donc on a moins de faux
positifs.

Et bien sur, ses slides sont [dispos online](http://bit.ly/pwdevtools).





