---
layout: post
title: "Nodejs Paris S01E03"
tags: nodejs
---
http://www.meetup.com/Nodejs-Paris/events/148607672/

La conférence avait lieu dans le grand amphi d’EPITA. Une centaine de
personnes. Co-organisé par Etienne Folio et Quentin Raynaud. Organisé tous les
2e mercredis de chaque mois. Centré sur node, mais aussi du js front (Backbone,
Ember, Angular, jQuery).

Première présentation de 10mn sur Express. Surcouche de surcouches.
Présentation rapide des convenient methods d’express, et de la batterie de
app.set() à définir au début d’un projet express. Explication rapide des
middlewares et des templating engines.

Globalement la conférence était plus une présentation ligne par ligne d’un
boilerplate express. Assez confus et pas passionnant. Heureusement que FJA
m’avait expliqué Express plus tôt dans la journée.


Deuxième présentation beaucoup plus impressionnante, d’Alexandre Strzelewicz, sur pm2.

https://github.com/Unitech/pm2

pm2 est un process manager en cli pour node qui permet de lancer son appli node
sur chaque CPU de la machine hôte et agit comme load-balancer pour renvoyer les
requetes équitablement entre tous les CPU (il faut bien sur une appli stateless
pour pouvoir en profiter).  Il permet aussi de relancer ses instances sans
downtime. Une nouvelle instance est créée et accepte les nouvelles connections
pendant que l’ancienne termine ses connections en cours avant de s’éteindre.
Cela utilise le mode cluster de node, mais l’expose selon une API beaucoup plus
simple à utiliser par le dev. Les différentes instances peuvent communiquer par
un systeme de pub/sub qui permet de broadcaster des events (mais le dev avoue
ne pas avoir trouver de use case interessant).  Fourni avec un monitor en cli
qui permet de voir la charge de chaque instance et de reload/restart/etc. Pense
faire une version SaaS dans le futur.

Dernière présentation de Bruno Jouhier sur les génerateurs ES6. L’ayant déjà vu
à ParisJS je n’y ai pas assisté, mais vous pouvez trouver les slides ici
: http://prezi.com/y4zkffcri6w1/asyncawait-avec-les-generateurs-harmony/


