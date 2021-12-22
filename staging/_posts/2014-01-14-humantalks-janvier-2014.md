---
layout: post
title: "HumanTalks Janvier 2014"
tags: humantalks
---

## Introduction

C'était la première fois que j'assistais aux HumanTalks. Je pense que j'y
retournerai régulièrement, ça ouvre des reflexions sur pleins de choses
annexes à la vie d'un developpeur sans trop rentrer dans le technique. Très
rafraichissant.

Ca se passait à La Cordée, un espace de coworking vers la gare de Lyon. 4
Talks de 10mn chacun + questions. Avec un  ROTI à la fin (mais pas à la
manière OCTO du mélangeage de doigts, mais de marquer une croix dans une des
trois colonnes Bon, Moyen, Mauvais de chacun des talks).

### Ecrire sur Internet, c'est mieux avec Markdown

{% youtube https://www.youtube.com/watch?v=hdM1wltUTyQ %}

Présentation de markdown. Vu que je prends déjà mes notes en markdown, prendre
les notes de ce talk avait un petit coté inception.

Markdown est un moyen d'écrire facilement sur internet. C'est un système de
mise en forme de texte simple, sans avoir besoin de logiciel particulier, qui
permet de rendre un texte à la fois facile à lire et facile à écrire, tout en
gardant une hiérarchie, et quelques bonus (emphase, liste, liens, etc).

Bien sur, il y a un script perl qui convertit le markdown en html. Markdown
est utilisé (dans des versions légérement modifiées) par github et
stackoverflow.

### Les MOOCs

{% youtube https://www.youtube.com/watch?v=rrMwbQf7D7M %}

Par Yannick Grenzinger, de Xebia.

Ce sont les Massive Open Online Course. C'est à dire les systèmes de cours en
ligne à la coursera. Les cours drainent en général entre 50.000 et 200.000
inscrits (beaucoup moins de réels personnes qui suivent les cours jusqu'à la
fin, mais des volumétries quand même honorables).

Globalement les cours sont gratuits et fait par des pointures (Google, ou le
créateur de Scala qui donne un cours de Scala). Les cours sont de haute
qualité en général.

Cela dit, les cours ne sont pas complétement ouverts. Il est souvent
interdit/impossible de télécharger les vidéos ou les supports des cours. De
plus en plus de cours deviennent payant au bout d'un moment (les premiers sont
gratuits pour créer une envie, puis deviennent payants).

Certains cours sont à heures fixes, d'autres sont accessibles 24/24.
Paradoxalement, les cours à heure fixe ont plus d'étudiants que les autres,
car on a tendance à se dire “je le ferai plus tard” pour ne jamais le faire au
final.

Le speaker avertissait qu'il était un peu boulimique des cours, qu'il en
faisait beaucoup, voire trop. Ses conseils étaient de télécharger les vidéos
pour les regarder dans le métro et de garder le temps réel devant son pc pour
les cotés pratiques. Et surtout, de ne pas fréquenter les forums des cours,
rapport temps investi/choses apprises est faible par rapport aux vidéos.

Les cours de business sont les plus faciles. Les cours d'UX ne sont pas durs
mais nécessitent beaucoup de travail. Les cours de code sont les plus longs et
les plus durs.

Certains cours comme ceux de code peuvent être validés automatiquement (check
de l'input et de l'output). Les cours d'UX doivent être validés manuellement,
donc un système de peer review est mis en place. Chacun doit évaluer 5 cours
de 5 autres étudiants random pour que le sien soit aussi reviewé. Selon lui
cette étape est beaucoup plus facile dans les cours américains que dans les
cours français où les reviewers sont généralement moins laxistes.

Il conseille particulièrement coursera pour la qualité des cours. Il indiquait
aussi qu'être prof d'un cours comme ça était une très bonne pub qui permettait
aux auteurs de se mettre en avant, et de vendre leurs livres avec beaucoup
plus de légitimité.

Il a fini avec une liste de recommandations :

  * Startup Engineering.
  * Intro aux Malwares.
  * Reactive Programming.
  * Comment créer son entreprise
  * Human computer interaction
  * Gamification.
  * Social Psychology

### LES LANGAGES ESOTERIQUES

{% youtube https://www.youtube.com/watch?v=1LEDsHHR6PA %}

Conférence amusant et wtf sur les langages ésotériques, comme le brainfuck,
dont le but n'est pas d'être lisible, ni même d'être pratique. A partir du
moment où le langage est capable d'effectuer une liste d'instructions
élémentaires, il est dit Turing-complet (ceux qui sont plus calés que moi en
algo, reprenez-moi quand je me trompe), et tout langage turing-complet est
capable d'exprimer n'importe quel autre langage turing-complet.

Le brainfuck, dont les seuls caracteres autorisés sont <, >, +, -, [ et ] en
est un. Tout comme Piet qui s'écrit avec des images composées de pixels tirés
d'une palette de 17 couleurs et la transition d'une couleur à une autre se
traduit en une instruction, avec un pointeur qui se déplace de pixel en pixel
pour executer le code.

(A ce moment il a été demandé pourquoi on n'utilise pas Piet en place des
QRcode. A part les problématique évidentes de sécurité, l'idée est
interessante.)

Puis vint la présentation de langages tous plus wtf les uns que les autres :

Le Malbolge, qui est fait pour être impossible à programmer.

L'Unlambda, qui n'est constitué que de fonctions.

Le whitespace où les seuls caracteres possibles sont space, tab et new line.

Plus d'infos sur :
[http://esolangs.org/wiki/Main_Page](http://esolangs.org/wiki/Main_Page)

### L'entreprise comme malade mental

{% youtube http://www.youtube.com/watch?v=STsrVWhx4jQ %}

Sans doute la conf' la plus captivante de la soirée, en partie pour les
discussions qu'elle a entrainée autour d'une bière ensuite.

En gros, le speaker comparait les entreprises à des personnes atteintes de
maladies mentales, et faisait des parallelles très intéressants. Il avait
isolé trois pathologies principales.

Les anorexiques/boulimiques sont des sociétés qui vont acheter des filiales…
puis effectuer un plan social. Ou créer un nouveau service, avant
d'externaliser. Ca pose evidemment des problèmes de digestion la masse
salariale devient comme une friandise dont on ne parvient pas à gérer excès.
Difficile ensuite pour la société de garder sa ligne et de s'aligner avec les
critères de beauté du marché.

Les hypochondriaques, qui sont persuadés que quelque chose ne va pas chez eux.
Alors ils demandent des audit, des coachs, et ont une surconsommation de
consultants exterieurs. Ils font des séminaires, de réunions, des
réorganisations. Leur pole RH devient hypertrophié et touche à tout.

Au final, cela leur cache leurs vrais problèmes. Ils fantasment sur des
problèmes qui flattent leur image sans voir la vraie cause. Ils deviennent
très liés à leurs consultants, et finissent par racheter les sociétés de
conseil, pour avoir leur médecin directement chez eux. Au bout d'un moment
cela crée des jalousies en interne et tout le monde veut alors sa part des
soins.

Les derniers sont les bipolaires, qui alternent des phases de croissance
fulgurante avec de longues périodes de doute. Particulièrement les startups,
qui ont des changement de business plan très souvent. Qui “pivotent” à tout
va, font des revirement à 180° et perdent complétement leurs employés.

Ils sont dans la surenchère, ils font beaucoup d'effets d'annonce flamboyant,
alors que leurs résultats sont fragiles. Ils font tout pour garder la tête
haute et avoir l'air bien portant devant le monde exterieur alors qu'en
interne tout n'est pas si facile. Ils supportent mal la critique.

