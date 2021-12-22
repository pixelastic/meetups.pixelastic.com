---
layout: post
title: "PerfUG - HTTP2"
tags: perfug
---

1/3 front, 1/3 back, 1/3 devops

http simple, mais plein de subtilités sur les headers
plein de rfc pour suivre ce qu'il se passe
lourd, verbeux. headers en request, headers en response
35 images = 35 headers renvoyés

overhead. plein de headers pour dire le content-length, on utilise 21%
d'overhead

TCP lent au début. plusieurs échanges pour avoir la vitesse optimale.
HTTP pas cool là dessus. pas assez de temps passé sur petits ssets pour utiliser
au max
1 requete/1 réponse. moyenne 93 requetes/page, 37 TCP, 2MB

### SSE

now. SSE. ServerSentEvent/EventSource. Nouveau mimtype `text/event-stream` qui
passe un `data: foobar` (ou plusieurs). On peut dire au browser la fréquence de
retry. Possibilité de mettre des ids pour dire au server quand fial, types de
messages.
`EventSource` en js, natif. Stream backend en ce qu'on veut
cool pour faire du pubsub. reste en http, du coup pas de soucis de firewall

possibilité d'écouter en background en SSE, pousser des trucs en localStorage
pour les avoir direct. Super avec React, on pousse des états depuis le serveur,
update le front.

need polyfill IE, sinon partout

### WebSocket

bidirectionnel
nouveau protocol `ws://`. HTTP1.1/Upgrade pour prévenir que WebSocket. Envoie
challenge, si serveur réponds ok, alors je sais qu'il fait du bon websocket. Si
les deux matchent, protocole binaire asynchrone.
JS `Websocket`, `addEventListener`, bidirectionnel.
coté serveur pour un chat on écoute les octets en entrée, on les rebalance sur
les autres connection. Serveur fait tout là.

facile de wrapper une console pour faire du tunelling facile
collaboration en ligne, jeu multiplayer
cool pour faire une version en ligne de ligne de commande

IE10+, Android 4.4+
probleme, bloqué par infra/firewall/proxy si ressemble pas pas à ce qui passe
sur :80. Marche le mieux en https (95%)

### WebRTC

peer2peer entre users
channels pour envoyer audio, video, data arbitraire
configuration des garanties (fiable/non fiable latence, data, etc)
sharedrop.io pour s'envoyer des fichiers si sur le même LAN
bittorrent dans le browser fastcast.nz

FF, Chrome ou Android only

### HTTP2

but est de simplifier la weperf. que le browser fasse ce qu'il faut pas défaut

- une seule connection TCP vers un site. sinon se marche dessus.
- protocole texte lent, pas utile pour la machine. binaire
- retrocompat HTTP1.1
- toutes les requetes dans un même tuyau
- compression des entetes
- serveur envoi des ifos aussi
= HTTP2, enrobage binaire de HTTP1

vraiment utile sur mobile, sur réseau mauvais

## deux variantes
existe une version `h2c` qui fonctionne sans l'encapsulation https. mais même pas
implémenté dans les browsers

## binary

on découpe donc les headers dans un coin, et le content ailleus
chaque requete a un id, mais même tuyau. serveur réponds des réponses mélangées,
mais identifées par id, donc client recompose
possibilité d'indiquer des dépendances de requetes. une dépends d'une autre, pas
la peine de retourner une feuille de style si pas retourné la page. possibilité
de donné une poids aussi, pour indiquer au serveur laquelle doit etre renvoyé
lus vite.
les dependenaces sont fixes, ne retournera pas si pas son parent. poids permet
de mélanger plusieurs requetes ensemble, mais dire laquelle prends le plus de
poids (80% pour les images, 20% pour les CSS par exemple)

controle donné à qui pour les priorités? front-dev our browser

serveur peut aussi pusher de la data. serveur peut dire "tiens, tu devrais
prendre ce fichier css et js" avec ça. possible d'envoyer les datas directs.
mais le client peut l'avoir en cache. et le client peut annuler des streams si
le serveur lui envoie un truc qu'il a déjà.

(client envoie en impair, serveur en pair)

## compression

spdy était en gzip. probleme de secu en ssl
table de huffman pour les headers en HTTP2
après la première transmission, les headers sont codés en 1 octet sur les
suivants
certaines double clé/valeur (path:/, method:POST, etc) sont directement codé
comme un header


## improvement
pas de garanties. -15% jusque +300%
sur petites pages optimisées, on risque d'y perdre
mais en moyenne +20%
pour en tirer partie, need de modifier le site. si déjà bonne connection, change
rien, si mobile, gros gains

une connection. si problème, tout est bloqué.
http plein de connections, un truc casse, le reste peut passer

coté serveur on ne tue pas le pool de connection Apache, vu qu'il utilise
toujours les mêmes
vu que ssh, on a un startRender plus lent vu que handshake à gérer. idem que
https avant


## webperf
soit on optimise les animations/interatcio
soit on optimise la vitesse de rendu = HTTP2

pour rendu
soit on triche en distraynat
soit on afiche plus vite = HTTP2

70% du temps de render passe sur le network
pour améliorer latence: on mets des CDN. on peut rien faire sur la bandiwth
compression pour réduire les octets
réduire les requetes
gérer les priorités pour avoir le tryc le plus utile d'abord. mais un peu
voodoo, change à chaque update de browser. Laisson donc faire les browsers

http2 plus beosin de réduire les requetes ou de les prioriser
par contre on continue les CDN et la compression

site optimisé en HTTP1, pas optimisé HTTP2 et réciproquement

## devs
meilleur http, hop, facile
meilleure gestion du cache browser (on peut pusher)
priorization coté serveur
plusgénéralement, server sent event


## push

pas  vraiment d enorme pour svaoir quoi pusher quand
c'est bien beau mais ça reste manuel
àla rigueur Jetty écoute tout et fait des stats en push automatiquement si
threshold atteint

## deploy
possible sur CDN, cloudflare, Akama, MaxCDN (spdy sous nginx, mais va migrer)
À la main, Nginx, PAache
Ou.. applicatif Go, Node. plus avancé pour choisir quoi pusher, mais alors
transaction géré par application (plus lourd)

## test
rluta/http2 en docker.  tout compilé, install
chrome://net-internals/SPDY#http2 debug tout
`nghttp` en cli pour voir les packets
ou sinon wireshark mais avec ssl, long
`docker run` dans son image pour générer un serveur http2 sur un site existant
pour tester

possibilité d'utiliser HAproxy (qui comprends pas http2) en mode tcp pour
envoyer vers un serveur en http2 ou en http (need deux serveur). en interne
utilise h2c (pour pas avoir ce ssh en interne).
utile si on veut ajouter http2 pour ceux qui savent le gérer, rester en http1
pour les autres

## limites
pas de websocket en http2
systeme de push pas normalisé
si TCP bloqué (ou perte de paquet sur réseau), tout déconne
ssl, donc plus de cache ni de proxy



## Algolia
push si update de data?
