---
layout: post
title: "Node.js Paris Chapitre 1, Conférence 3"
tags: nodejs
---

La conférence avait lieu dans le grand amphi d'EPITA. Une centaine de
personnes. Co-organisé par [Etienne Folio][1] et
[Quentin Raynaud][2]. Organisé tous les 2e mercredis
de chaque mois. Centré sur node, mais aussi du js front (Backbone, Ember,
Angular, jQuery).

## Bien démarrer avec express.js

{% youtube https://www.youtube.com/watch?v=III-Wr_DEaI %}

Première présentation de 10mn sur [Express][3]. Surcouche
de surcouches. Présentation rapide des _convenient methods_ d'express, et de la
batterie de `app.set()` à définir au début d'un projet express. Explication
rapide des middlewares et des templating engines.

Globalement la conférence était plus une présentation ligne par ligne d'un
boilerplate express. Assez confus et pas passionnant. Heureusement que [FJA][4]
m'avait expliqué Express plus tôt dans la journée.

## Gérer des processus NodeJS, améliorer leur performance et les monitor avec PM2

{% youtube https://www.youtube.com/watch?v=ixJ2O1PUrSI %}

Deuxième présentation beaucoup plus impressionnante, d'[Alexandre
Strzelewicz][5], sur
[pm2][6].

pm2 est un process manager en cli pour node qui permet de lancer son appli node
sur chaque CPU de la machine hôte et agit comme load-balancer pour renvoyer les
requêtes équitablement entre tous les CPU (il faut bien sur une appli stateless
pour pouvoir en profiter). 

Il permet aussi de relancer ses instances sans
downtime. Une nouvelle instance est créée et accepte les nouvelles connections
pendant que l'ancienne termine ses connections en cours avant de s'éteindre.
Cela utilise le mode cluster de node, mais l'expose selon une API beaucoup plus
simple à utiliser par le dev. 

Les différentes instances peuvent communiquer par
un systeme de pub/sub qui permet de broadcaster des events (mais le dev avoue
ne pas avoir trouver de use case intéressant). Fourni avec un monitor en cli
qui permet de voir la charge de chaque instance et de reload/restart/etc. Pense
faire une version SaaS dans le futur.

Les slides sont dispo [par
ici][7].

## Les générateurs d'Ecmascript 6

{% youtube https://www.youtube.com/watch?v=4dRlQLRkKi8 %}

Dernière présentation de [Bruno Jouhier][8] sur les
génerateurs ES6. L'ayant déjà vu à ParisJS je n'y ai pas assisté, mais vous
pouvez trouver les slides
[ici][9]


[1]: https://twitter.com/ornthalas
[2]: https://github.com/qraynaud
[3]: http://expressjs.com/
[4]: https://twitter.com/floby
[5]: https://twitter.com/strzel_a
[6]: https://github.com/Unitech/pm2
[7]: http://www.slideshare.net/Alexandre-Strzelewicz/pm2-pres
[8]: https://twitter.com/bjouhier
[9]: http://prezi.com/y4zkffcri6w1/asyncawait-avec-les-generateurs-harmony/
