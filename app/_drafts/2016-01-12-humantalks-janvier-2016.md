---
layout: post
title: "HumanTalks Janvier 2016"
tags:
---

## Apache Zepellin

Saad HAnsari (spell?)

grosse geeration de donned tech et metier, logs
voulaient faire quelque chose de ces données, les étudie ren tirer des trucs
mais données en vrac, pas triées, gros garbage "il suffit de les trier"

integrer les données, les analyser, les visualiser

(Notebooks, IpyN, Jupyter)

OPenData RATP. metro, ligne, correspondance, villes, etc
intégration dans zeppelin
Zeppelin foncionne globalement avec Spark, pour parser les data
monte un tableau en colonnes pour faire des requetes dessus.

En gros, CSV vers SQL et requetages dessus, + graphs
système de drag'n'drop pour faire les requqtes

semble basique, pas sur à qui ça s'adresse? Je ne fais pas de bigData, je ne
ferai pas ça. Et sans doute trop basique pour experts.
L'avanage est que ca peut parser facilement plein de formats, et jouer avec pour
tenter des les correler. Pas mal s on doit trouver un sens à un tas de data
hétéroclite. Genere des reports visuels, et peut le croner

"Notepad++ du BigData"


## L'infini ou pourquoi il est plus petit que vous le pensez

Mathématicien, dévéloppeur 

signe infinie, "fourre tout de l'école"

préset dans onception de epsace et du temps depuis toujours
pose proleme dans

besoin de trop réfléchir pour prendre des notes. Néanmoins intéressant

## Pourquoi est-ce si difficile de concevoir des API

Alex Estela

Restful basée sur HTTP
Concevoir: interface d'échange, pas les technos ni les infras

Consultant senior, mauvaise pratique chez les clients

mauvaises idées
api qui fait du soap
api miroir du SI, quie xpose tout n'importe comment
api usage unique, genre pour appli mobile
api fourre-tour, a rétro ingineerer soi-même, trop complexe

## techno

pas un probleme de techno
HTTP on connait, json a se traite easy
même la sécu c'est compliqué mais standard, on gère
http2 va changer mais pas plus que ça

probleme de ocncept
rest c'est pas un standard c'est des principes théoriques
plein de manières différentes de le faire, pas de bonne méthode à 100%
les bonnes pratiques ne sont bonne que dans un contexte donné, mais de manière
générale

probleme d'outillage
3 standards de spec( Swagger, RAML, Blueprint), mais tous des bons choix
forces et faiblesses de chacun
convergent les uns vers les autres, s'améliorent

gros probleme de méthodo
top down, bottom-up, test driven, code first, whatever
spécifique pour le besoin, pas de meilleure méthodo
d'abord les grosses features à valeur ajoutée?
plutot avoir une grosse communauté de développeurs? DX
suivre les contraintes du SI existant, organisation, partenaires?
de toutes façons: prototypes, itéraion, vraies données, vraie infra, vrais cas
de test. "Appellez ça Agile ou Lean si vous voulez"
faire une API est comme faire un logiciel après tout

probleme de collaboration
collaoration est la base
fournisseur expose aux collaborateurs, collaboration au centre
rituels de discussion entre les deux parties
feedbacks récurrent, démos, formation, au fil de l'eau
documentation primordiale, la doc est un projet à part entière aussi important
que l'API

conclusion
spécial, mais reste un logiciel
nouveau vocabulaire, on pousse un peu le HTTP dans ses retranchements, pas si
easy, mais pas le prolème de fond
le logiciel fonctionne quand:
on prototype
rester pgramatique sur les concepts
proche des ocnsommatteurs
apprendre de ses erreurs
outillage moderne
grande collbaoration entre tous les acteurs

méthodo et collaboration avant concepts et outils (Agile Manifesto)

meilleure stratégie de version: prévenir dans les headers, etc les changements
rester retro-compatible, avoir les deux versions en parallelle

## Why do tech people hate sales people ?

son job c'est de vendre



