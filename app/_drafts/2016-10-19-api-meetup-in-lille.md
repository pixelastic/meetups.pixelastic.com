---
layout: post
title: "API Meetup in Lille"
tags: api
---

Nicolas Grenié @picsoung
API design
best practices to create a successful API
3scale => triskell

3scale, decathlon, the telegram
API est une interface
comme la UI, interface entre deux choses (UI = human - machine)
API est interface code / machine. l'un a besoin de data, l'autre expose ls data

There is an API for that
Stripe, GMaps, Mailjet, Twilio
Font le travail compliqué de manire simplifié
peuvent avoir accès a de meilleurs deals car gros acteurs (mails pas bloqués par
Mailhet, paiement mieux accepté pa Stripe, Twilio deals avec opérateurs)

sociétés spécialisés, peuvent faire plus que ce que vous povez faire
concentrez vous sur le but de vore boite, laissez faire le reste par des experts
qui ont résolus le soucis

You need an API
- Netflix présent sur plein d edeives, car la logique se trouve dans l'API, pas
dans les devices
- applications par dessys GitHub pour créer des CV par exemple, peret de créer
  de la valeur indirectement sur un outil
- Slack est juste un IRC plus joli, mais aussi ouvert des bots et integrations.
  On essayé HipChat, fait des integrations à la main. En 3 jours ont migrés vers
  Slack car super facile de s'y connecter. Ouvert les API dès le premier jour
- ESPN a plein de data sur les joueurs. Vendent les données sous forme d'API
- API as a business. Twilio, Stripe (and Algolia)

Plan the API
Besoin de savoir la cible de sutlisateurs, quels habitudes, qule format, quels
usages
Exemple: Velib ne donne pas les stations géolocalisées, juste une liste, mais
après un job local pour trouver les plus proches

Versioning.
Quand changer la version? Quand deprecated? Quelle roadmap?
Zynga et Facebook, petent l'API régulièrement, perdent des sous
Do not explicitly version, non-breaking changes
Prevenir les utilisateurs quand on break

Suivre les bons verbes HTTP
Sinon les devéloppeurs sont perdus et ça freine l'utilisation
Codes HTTP
Document errors
keep /book or /books consistent
Supprimer les relations. Pas de /books/42/reviews/5/likes mais /reviews/5/likes
Intuitive + Documented + Opinated (from Parse CTO)
Interactive documentation through Swagger


Code
Grape, micro framework for Rest API in Ruby
Postman to test API in the Browser
Scalingo to deploy API
3Scale for Api management

API Gateway entre les users et serveurs
authentication, quotas
Analytics
(Latency?)













API Food: Notation des API?

ApiTools? Middleware pour plugguer deux API ensemble facilement?
Lua dans Nginx
Prendre la date de Velib, la pousser dans Algolia
Mettre à jour en temps réel avec Streamdata?
Ouvrir un endpoint public qui tape sur Algolia mais avec une autre signature
(plus simple)

Hack example: Expose a Velib endpoint with geoloc data.
Cron to get data every 5 minutes, expose Algolia endpoint with small lib
Streamdata to get the data. Send to backend? and reindex?
3Scale pour data



