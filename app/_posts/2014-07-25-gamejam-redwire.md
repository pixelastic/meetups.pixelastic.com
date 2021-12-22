---
layout: post
title: "GameJam RedWire"
tags: gamejam
---

Ce week-end il y avait une Gamejam organisée chez Mozilla. Je n'avais jamais
fait de gamejam avant, vu que la plupart du temps il faut savoir coder sous
Unity. Cette fois-ci, c'était différent et tout tournait autour d'un framework
en javascript nommé redwire. En plus, les co-organisateurs sont des amis.

Toutes les conditions étaient donc réunies pour que je participe enfin à ma
première gamejam.

Redwire est un système de programmation qui réplique le principe d'un circuit
électronique, et qui fonctionne en mode drag'n'drop. On y manipule des `if`,
des `loops` et un ensemble d'`inputs` et d'`outputs`. Pour être honnete, je
n'ai pas réussi à rentrer dans le framework. J'avais envie d'écrire mon propre
JS et CSS, pas de passer par les cases pré-établies du système.

Le créateur était là, et était d'une grande aide pour sauver les équipes qui
étaient bloquées. Il était plus ou moins le seul à connaitre le système, sa
logique, ses tweaks et ses bugs.

Redwire est quand même fondé sur un principe de modularité très intéressant.
Idéalement il est possible de récupérer des briques de gameplay d'un jeu pour
les incorporer dans un autre. On a donc divisé notre week-end en une phase
d'apprentissage du framework, la construction de briques individuelles, et
l'assemblage de ces briques pour en faire des jeux complets.

Afin d'éviter de partir dans trop de directions, on a limité le nombre de types
de jeux à trois : text-based, shooter et puzzle game.

Les jeux finaux qui en sont sortis étaient bourrés de bonnes idées,
malheureusement leur réalisation était assez pauvre. Même si j'ai passé plus de
temps à coder le site que vous êtes actuellement en train de lire plutot que
d'essayer Redwire, j'ai quand même passé un bon moment.

Ci-dessous, mes notes sur les différentes briques et les jeux en résultant que
j'ai prises à l'issue de la première journée.


### SHOOTER
- Ennemi téléporteur, à intervalle peut disparaitre et revenir à un autre
  endroit.
- Ennemi cloneur. A intervalle régulier, va se dédoubler.
- Ennemi Kamikazer. Fonce vers le personnage principal directement.
- Sortir d'un coté, rentre d'un autre.
- Mur d'obstacle qui fait tout l'écran, avec 3 couleurs et 3 sons. Son qui
  indique la couleur à passer.
- Clic, tir vers la direction de la souris.
- Bouclier de protection, protège autour de la souris.
- Power Down, fait doubler la taille du joueur.
- Touche appuyée, attire les ennemis, relache pour projeter.
- Labyrinthe circulaire et pivotant dont les murs sont mortels.
- Bonus qui multiplie par trois le personnage (3x plus fort)
- Ennemi aléatoire qui droppe un loot aléatoire.
- Ennemi au comportement évolutif (zigzag, spirale)
- Deux vaisseaux, touche et souris
- Boites bonus aléatoires


### TEXT-BASED
- Boite de dialogue. Portrait, texte, trois réponses.
- Mot apparait, temps limite pour le taper sur le clavier.
- Suite de mots dans le désordre, à remettre dans l'ordre.
- Mots qui disparaissent dans un bloc de texte, 1 toutes les 2 secondes.
- Dans un bloc de texte, certains mots, si on les tape, on gagne des points.
- Choix multiples
- Mémorisation des choix dans le passé du jeu
- Affiche la touche de controle qu'on appuie. Si mur, bloque, si ennemi,
  appuyer sur touche attaque.
- Pierre-Feuille-Ciseau
- Tooltip sonore
- Twister au clavier
- Spam d'une touche pour monter une entitée, si arrete de spammer, redescends
- Background qui réagit aux pressions du clavier


### BLOCK PUZZLE GAME
- Blocs avec lettre, tape sur lettre, le fait disparaitre.
- Grille 5x5, clic dessus, disparait et ceux au-dessus descendent.
- Grille dont les carrés changent de couleur quand on passe en hold dessus.
- Blocks à l'écran, touches de clavier dédoublent dans la direction indiquée.
- 3x3 avec un bloc de libre, faire glisser dans la case vide pour former
  l'image
- Deux joueurs Tetris, l'un modifie les blocs avant que l'autre ne le recoive.

### TECHNIQUE
- Tileset + matrix = image canvas finale
- Entrée texte avec choix multiple, retour un integer du choix
- X joueurs, pour que l'équipe gagne il faut que chaque joueur se soit
  spécialisé dans une compétence et en soit expert

### MES FAVORIS EN FIN DE PREMIERE JOURNEE
- Mur d'obstacle qui fait tout l'écran, avec 3 couleurs et 3 sons. Son qui
  indique la couleur à passer.
- Touche appuyée, attire les ennemis, relache pour projeter.
- Labyrinthe circulaire et pivotant dont les murs sont mortels.
- Deux vaisseaux, touche et souris
- Boite de dialogue. Portrait, texte, trois réponses.
- Mot apparait, temps limite pour le taper sur le clavier.
- Suite de mots dans le désordre, à remettre dans l'ordre.
- Mots qui disparaissent dans un bloc de texte, 1 toutes les 2 secondes.
- Dans un bloc de texte, certains mots, si on les tape, on gagne des points.
- Affiche la touche de controle qu'on appuie. Si mur, bloque, si ennemi,
  appuyer sur touche attaque.
- Spam d'une touche pour monter une entitée, si arrete de spammer, redescends
- Blocs avec lettre, tape sur lettre, le fait disparaitre.
- Grille 5x5, clic dessus, disparait et ceux au-dessus descendent.
- Grille dont les carrés changent de couleur quand on passe en hold dessus.
