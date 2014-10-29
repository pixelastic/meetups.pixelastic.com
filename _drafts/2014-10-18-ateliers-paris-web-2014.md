---
layout: post
title: "Ateliers Paris Web 2014"
tags: parisweb
---


Faire tout sur le client et seulement taper sur l'API pour avoir les données
entraine plein de processing de data coté client, ce qui peut etre mauvais pour
les perfs>.

C'est pas bon non plus pour le SEO. on peut contourner avec des gros hacks avce
pahntomjs.

Si y aune erreur JS dans le front, alors rien ne s'affiche du tout, aucune
tolrénace aux fautes dans le front.

Si on a du js coté client et coté serveur on doit quand même dupliquer la
logique, ca serait quand même cool vu que c'est le me langage de pouvoir merger
les dex, non? On appelle ça de l'ismorphic.

Pas de puplication de code, cohérence du code.

Aujourd'hui c'est encore un peu le farwest (framework, libs, convertisseurs).
Préférer les libraires qui fonctionnent de la même façon client/serevur.
Browserify


Autre solution, c'est les fwk. on code tout, et ça génére client et server.

Rendr, créé par AirBnB. Transforme du Backbone pour le client et le server.

Meteor, plateforme pour créée des app Js. Client et serveur à la fois.
Ecosysteme trop fermé, maintenu par une société.

React, développé par Facebook. S'occupe juste de la vue, pas de Routing, pas de
modèle. Se content de rendre les données dans l'appli. Juste le V de MVC. Se
décompose en composants et en états. Chaque partie de l'app est un composant,
plus ou moins complexe, composé de plusieurs composants. Chaque composant a des
états (ouvert/fermé par exemple).
Possible de faire de la compsosition de vue coté back pour créé du sttaic html
qu'il peut rendre directement.

Garde un virtual dom en mémoire, identifié par des ract-id, et quand l'un
change, il fait un diff et ne mets à jour que la différence.

Si erreur, fonctionne, mais indique des trucs dans la console.




CouchDB / PouchDB pour la DB ?
Question de sécurité, certains actions qui ne veut pas exposer au front.
Browseify ne créé pas des fichiers très lourds (chargement de libs core de
node) ?
Branches if server/if client, on emarque des branches de code serveur dans le
client, qui ne seront jamais executés, donc ça pese + lourd ?


## UX Blur

Cerveau percoit yune image en noir et blanc, et de manière floue (Gaussien 22).
Battonnets en fond de l'oeil.

Fovea au fond d elo'iel, peret les fixations, visition peripherique = vision
pare foceal. on voit les visages qui sont dans cette vision, on le sait, mais
on a besoin de la fixer pour etre sur. La foveal ne voit qu'une toute petite
parreie, n fait des saccade opour voir la totalité de l'image, pour la
deflouter et la voir en couleur.


