---
layout: post
title: "HumanTalks Avril 2015"
tags: humantalks
---

Chez Meetic. Évolution de SI, startup rapide, vers un truc plus REST, virer le
legacy. Passe en mode industrialisé, usine de dev, TDD, BDD, Docker, plein de
choses qui font rêver.

App natives de presta, faites en interne. Expérience web mobile. Refaire le
desktop, refait tout. Challengé par Tinder/Happened.

Sponsors Arolla, Octo, présents dans la salle.

## L'UX n'est pas là où vous le pensez

Christophe Michel, Arolla. 
Toilettes utilitaires uniquement. Bon exercice pour l'UX.
Raoul à la défense, en consulting.
Picto homme/femme pas clair.
Porte trop proche pour ouvrir
vasque de robinet, trop proches
sèche main "automatique"
porte à ouvrir, donc germes

LOL WUT?

Liste déroulante de centaines d'items --
Payer par carte, donner type de carte (se devine à partir du chiffre)
Messages cryptiques (Êtes vous surs de ne pas vouloir annuler votre action
? Oui, non, Annuler). Textes plus longs sur les boutons plutôt que Yes/No.
Afficher "non interdit", après que l'app propose quand même de le faire.
Messages très techniques, messages intimidants, fait peur au user.

Pourquoi ? Personne ne fait de l'UX. Dilué entre tous.

Prendre des gens d'autres équipes, leur faire tester. Se mettre à la place de
l'utilisateur.


Tests changer couleurs, taille police, basse luminosité, nouveaux arrivants sur
le projet.

## Famo.us / Angular

Vielle codebase. Famous viable technologiquement ? Viable = testable,
communauté active, innovant (pour se mettre au dessus de la concurrence).

Angular, on en parle pas, on connait, actif, réputé, détracteurs, on peut ne
pas l'aimer, mais a des bons points.
Famous, réussir là ou HTML5 a échoué. HTML5 permet de faire plein de choses,
mais pas performant. Animation, transition qui rame sur des téléphones de moins
de 3 ans (récent).

Promesse, 60fps, sur tous les devices. Plein de démos super chanmé. Table
périodique en 3D. Mais pas d'éléments de UX. Résouds la perf, c'est magique,
mais compliqué à utiliser.

ScrollView, composant de base, buggué. Cycles de vie différent Angular/Famous
à synchroniser. Tout est buggué.

Faut vouloir y aller. Sans Famous, UX, mais lent, rame, pas d'animation. Famous
permet d'avoir cette fluidité, mais difficile à coder.

Investir beaucoup pour offrir une bonne UX équivalent au desktop/app. C'est
couteux, mais c'est le seul moyen. 

DOM famous facile à tester. Communauté pseudo-active, 3 millions $ d'injection
de samsung. Innovation, y a que famous qui peut faire ça sur des vieux
téléphone.


## Google Guice

Injection de dépendances. Pauline @pauline_io
Duchess, Enseignant Marne la Vallée.

New

CvDao cvDao = new CvDao()
déclaré dans la classe, donc pas possible de le mocker facilement dans les
tests à moins d'avoir un fwk spécial
aussi on recréé un gros objet DAO à chaque fois, alors que chaque objet

Factory

Propriété privée cvDao partagé dans toute la classe
dans le constructeur on le créé en appelant la factory
Factory problèmes : factories sont statiques, difficile pour les tests
difficile à maintenir aussi, chaque factory peut avoir des dépendances en
grappes

Guice

On passe le cvDao comme param de création sur le new du cvService, qui le passe
dans la var privée. On ajoute une annotation @Inject pour lui dire de
l'injecter

On définit avec @provides pour dire qu'elle injection doit retourner quel type.
Injections nommées, pour choisir les providers à utiliser.



