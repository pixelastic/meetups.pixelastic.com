---
layout: post
title: "ParisRb Novembre 2013"
tags: parisrb
---

Meetup d'environ 120 personnes, à EPITA.

## Présentation de la lib Gosu

{% vimeo https://vimeo.com/79670121 %}

[http://www.libgosu.org/]() et [https://github.com/jlnr/gosu]()

C'est une librairie graphique qui fonctionne sous Mac, Windows et Linux pour
créer des jeux vidéos en 2D simple. Elle peut créer des fenêtres avec une
boucle de game play updatée à 60 images par seconde, afficher des images, jouer
des sons et intercepter la souris et le clavier. Hyper simple à mettre en
place, démo intéressante.

## Présentation de la lib websocket-rails

{% vimeo https://vimeo.com/79670120 %}

[https://github.com/websocket-rails/websocket-rails]()

Gem pour activer le support des websockets dans rails. Nécessite un serveur
basé sur EventMachine ([thin][1] dans l'exemple). Stable, testé sur centaine
d'utilisateurs simultanés. Peut être déployé sur plusieurs serveurs
synchronisés (utilise [Redis][2] pour ça). Démo rapide d'un
pub/sub en quelques lignes en écoutant des events sur le serveur.  Encore
quelques limitations : bugs sur des edge cases, securité et partage des events,
serveur ne capte pas les déconnections des clients, mais activement développé.

## Présentation de divers gems en rapport avec Redis

- [redis-objects][3] pour mapper directement des objets ruby dans Redis
- [ohm][4] idem que redis-object, mais plus léger
- [redis-rb][5] pour parler à Redis dans une syntaxe rubyiesque
- [redic][6] pour parler à Redis dans une syntaxe redisesque
- [nest][7] pour travailler avec des clés structurées (type “user:42:name”)

## Heimanu

{% vimeo https://vimeo.com/79696713 %}

Présentation du site [Heimanu][8] qui utilise [Discourse][9] en interne pour
proposer des discussions en temps réel entre ses membres. Ils se sont retrouvés
bloqués par le système de permissions de Discourse qui ne convenait pas à leur
appli, ils ont donc rajouté une surcouche à Discourse (elle aussi en
[rails][10] + [ember][11]) pour régler
leur problème. La conf était assez brouillon et très spécifique à leur usage.
Il leur a quand même été demandé s'ils n'auraient pas mieux fait de faire à la
main plutôt que de modifier Discourse. Réponse : Mauvaise estimation du temps
nécessaire à la modif (6 mois plutôt que 4), mais Discourse propose tellement
de choses que si c'était à refaire ils le referaient.

## Cache Rails 4

{% vimeo https://vimeo.com/79670042 %}

Finalement, présentation du caching HTTP dans Rails 4. En fait, plutôt
présentation du caching HTTP coté client tout court. `Max-Age` et
`ETag`/`Last-Modified`. 

Présentation des méthodes `expires_in`, `fresh_when`, `is_fresh`
pour tester tout ça.  Idée intéressante d'utiliser des `ETag` custom et de les
intercepter coté Rails pour accélérer des traitements (sans pour autant cacher
toute la page). Par exemple une clé Redis contenant les infos pertinentes.

Discussion sur l'intérêt de définir ces entêtes private (seul le client final
cache la ressource) ou public (tous les proxies sur le chemin peuvent la
cacher). Economie de requêtes sur le backend rails, mais moins la main sur
l'invalidation du cache).  (Pour info, [cette page][12] explique très bien les
mécanismes de cache client)

[1]: http://code.macournoyer.com/thin/
[2]: http://redis.io/
[3]: https://github.com/nateware/redis-objects
[4]: https://github.com/soveran/ohm
[5]: https://github.com/redis/redis-rb
[6]: https://github.com/amakawa/redic
[7]: https://github.com/soveran/nest
[8]: http://heimanu.com/
[9]: http://www.discourse.org/
[10]: http://rubyonrails.org/
[11]: http://emberjs.com/)
[12]: http://www.mnot.net/cache_docs/#CONTROL
