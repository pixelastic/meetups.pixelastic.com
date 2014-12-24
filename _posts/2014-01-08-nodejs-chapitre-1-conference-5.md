---
layout: post
title: nodeJS Paris Chapitre 1, Conférence 5
tags: nodejs
---

## Introduction

Cette fois-ci c'était dans les sous-sols de la mairie de Paris.

## PARIS IS API

Présentation de "Paris Numérique”, le département de la direction de la
communication de la ville de Paris. Ce sont les responsables du site paris.fr
et de tous les sites annexes sur les actualités de la ville (~300 sites, dont
paris plage, velib, etc).

Ils ont particulièrement deux sites dont ils sont fiers :

[equipements.paris.fr](http://equipements.paris.fr/) qui référence toutes les
piscines, parcs, écoles, etc de la ville, avec placement google maps. Pour
chacun ils ont des infos contextuelles en temps réel comme les heures
d'ouverture, si la piscine est actuellement bondée ou non, etc.

[quefaire.paris.fr](http://quefaire.paris.fr/) qui est un agenda des sorties
culturelles et des loisirs de paris.

Toutes les données utilisées dans ces deux sites sont accessibles publiquement
par des API et documentées. Les données sont des données en temps réel, on
tape réellement sur les bases de prod (nécessaire par exemple pour des events
qui sont annulés au dernier moment). Leur documentation est générée
automatiquement à partir du code. L'accès est gratuit, il faut juste demander
une clée d'API pour qu'ils monitorent l'usage.

Techniquement c'est construit sur une stack MEAN (Mongo/MySQL, Express,
Angular, Node).

Et c'est disponible sur [demo.api.paris.fr](http://demo.api.paris.fr/)

Avec en plus le code de génération de la doc dispo sur github : [https://githu
b.com/ParisNumerique/MakeMeApi](https://github.com/ParisNumerique/MakeMeApi)

Très intéressant, ça donne envie de jouer avec les données.

## Grunt

{% youtube https://www.youtube.com/watch?v=LKolEWyBcSk %}

Présentation rapide de Grunt, mais sincérement regardez les screencasts de
CSSTricks ou egghead.io et vous en saurez autant, voire plus.

## node-libspotify

{% youtube https://www.youtube.com/watch?v=z8eccPT8EXc %}

Présentation de Florent Jaby et de son module nodejs qui wrappe la libraire C/C++ de
spotify pour la rendre accessible depuis node. Florent étant un collégue, je
n'ai pas pris vraiment de notes, sachant qu'il pouvait m'expliquer tout ça
directement si besoin.

Très bonne présentation cela dit, Florent a réussi à rendre compréhensible et
amusant un sujet qui est à la base pas super simple.

## Growing your prototype

Finalement un REX sur quand et comment passer d'un prototype à quelque chose
de mieux construit. Ce que j'en ai retenu c'est qu'il préconise de ne pas se
lancer dans les tests ou le TDD trop tôt dans la vie du projet. Au début on
experimente, on essaie, et si on commence à mettre des tests, ça nous bloque
dans une vision, et on a du mal à jeter tous les tests qu'on a fait.

Dans la même veine, pour tester la faisabilité d'un proto, ils n'utilisaient
même pas de DB, tout était dans des fichiers plats JSON. Plus facile à éditer,
versionnable, pas de problématique de scaling. Ce n'est qu'une fois qu'ils ont
vraiment été sur du set de fonctionnalités qu'ils voulaient qu'ils ont
commencé à choisir une vraie techno pour leur db, et qu'ils ont alors commencé
à la tester.

D'un point de vue technique, il donnait quelques astuces pour faire du quick
and dirty en node. Comme par exemple définir un app.all() qui filtre toutes
les requetes, check que les parametres indispensables soient bien là, fait
quelques manips de data élémentaires et modifie la requete en conséquence
avant de la laisser passer aux app.get et app.post plus précis ensuite.

Il conseillait aussi la library [paperwork](https://github.com/lperrin/paperwork)
qui permet de valider un schéma de JSON simplement, à intégrer dans une API
REST. Elle retourne un 4xx avec le détail de l'erreur de validation si le JSON
envoyé ne corresponds pas à ce qu'on attends.

Il montrait finalement une micro-library maison nommée `transquire` qui
remplace `require` et qui lui permet de mocker des modules, comme par exemple
des drivers mysql qui retournent des données simplement en RAM plutot que de
taper dans leur DB. Pour ça, il modifie l'objet require.cache pour toujours
retourner son mock plutot que le véritable module. Il ne l'a pas publiée car
la librairie fait à peine quelques lignes.

