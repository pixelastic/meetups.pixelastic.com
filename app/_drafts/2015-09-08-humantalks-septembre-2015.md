---
layout: post
title: "humantalks septembre 2015"
tags:
---

## POO: Historique

Développeur depuis 15 ans, Aspectize

Qu'est-ce qu'une erreur. Meileure facon de faire? plein de gens font, est-ce
bien ?

Si POO était si bien, on serait pas en tant de problemes en erreur, de
dépassement de projet, de temps, de cout, etc. La preuve,plein de nouvelles
facons de faore, tdd, dddd, orm, MVC, etc. Pas si simple

définition. tomate fruit ou légime. on pinaille pas. on passe sur les détails.
Alan Key. Grand bonhoimme, invente la POO, mais lui-même pas convaincu

"extreme llate-binding of all things" coeur de tout pour le speaker

object = etat + behavior
encapsulation, polumorphisme, héritage

## Encapsulation
encapsulation, nécessaire. très bien, mais pas spécifique au POO, on encapsule
la difficulté sous des éléments supérieurs. On a ça partout. boite noire,
engranage et mécanisme, ville = encapsulation de voies de voiture, gaz, eau,
internet, etc

plein de maneres différentes, casse, module, fponction, vm. pas un déail de
prog, un détail d'archi. connaitre les échelles des grains dans les
encapsulation.

## Polymorphisme
partout. sony se branche sur Philips, cartes graphiques s'emboitent dans cartes
son des autres, standard, donc polymorphe et intéragit. need a standard

## Héritage
erreur historique
depuis aristote, on classifie à priori. il n'y a pas de "mammifere de base". on
peut etre plusieurs choses à la fois.

sartre classification à posterior, on ne dépends pas, on évolue

syntaxe simple, dépourvue de sens. ne se mets pas en place dans l'industrie, on
ne fait pas de véhicule de base, qui puisse etre un vélo comme un avion




métier de faire circuler l'information, n'a rien à voir avec les obets.
alternative à OOP, AOP
séparer technique de métier

héritage peut etre intéressant si complexe, si objet peut etre de plusieurs
types, mais pas de dépendance pere/fils



# Scrapoxy

Fabien Vauchelles
@fabienv

Scraper en nodejs

si moteur de comapraison de prix, va scrapper les prix pour les récupérer.
moteur va devoir lire les pages destinées à un humain et transfrme en json

on fait un business avec ces infos, du coup boites veulent se proteger de ça en
autorisent saulement les browser, pas les scrapper

detectes le nombre de requetes, dans un court laps de temps sur une même ip

ou detecte le User-Agent, regarde en JS si bouge souris ou tape clavier, teste
un captcha

technique 1, on reste sous le radard, on fait peu de requetes
on se cache derrière un proxy, du coup on divise le nombre de requete par proxy.
Scrapoxy est un proxy de proxy

on push des proxys sur amazon, on pop des proxys, ça marche moyen. ça die, le
sinstance vont etre blacklistées, tombent, du coup limite atteinte à nouveau

gestionnaire de proxy. provionne les proxys sur ec2, check qu'elles soient
vivantes, change l'adress ip toutes les 10 minutes, supprime les instance
blacklistées du pool

srapoxy = proxy de proxy + proxy manager

monitor la vitesse des requetes, si diminue alors site tombe ou blacklist pas
intéressant
checke aussi que le connections apr minute augmentent


possibilité de préciser sur quel proxy envoyer (on sait par où il est passé)
pour toujours passer au même endroit


# Why do we fix bugs

Michal Svacha, Czech Republic
programmer, musician, AI

essaie plein de choses, sans comprendre le probleme. fix les symptoms, pas la
raison. programmer, fix les problemes

juste une variable  change

pourquoi on fix des bugs, pour faire plaisir au PM. I come to job to make the uy
in suit smile by fixing bugs

addict to get things done, fixing more bugs, pas une fin en soi. Data-driven
vers le goal, sur un nombre

vouloir satisaire le client n'apporte rien, ford avait des gens qui voulaient
des "faster horses". on se focus sur la detsination finale

What is a bug?
forogotten implementation detail
untested edge case
change in prod environement
unexpecte input/output
known unknown
unknown known
lack of experience of the programmer?

What makes a good progr a great one?
knowing right level of abstraction
right metaphor in code (naming variable)
where to look for implementation detail
knwoing how to search and what to look for
not being afarid to thow away code

fixing bug is gaining exeperience. it is about the road, not the detsination

we do not fix bugs for the sake of fixng them
bugs are fixed so we can see what we overlooked.
@miguelitinho


# ReactJS in production

Clément Dubois, @clement_d

clubmed chili
besoins: rwd, multii-device, fluide, seo, rapidité

react est une lib, pas un fwk. on décompose en composants

chaque component a un état privé, si state change, component se re-render

besoin d'afficage direct pour flickering et SEO, du coup need server-side
rendering

server frappé apr la requete est en node, même code qu'en local. On tape sur
l'api/cms pour récupérer les data. On les mets dans un store (BaobabJS), pour
récupérer toutes les infos.

on execute ensuite react coté serveur, qui n'utilise pas le DOM du browser, mais
un virtual dom avec un moyen de render en sring. il peut donc faire un affichage
comme le browser et renvoyer cette page vers le client

react est capale de retrrouver ses petites dans le HTML. il récupère aussi le
store du serveur. si mise à jour, envoie requete à l'API, recoit de quoi mettre
à jour son nouveau store.

Store avec toutes les données, Component View en huat de l'arbre. View écoute
une partie du store (un pointeur, une certaine clé) et est au courant quand mis
à jour.

View instancie plusieurs composants fonctionnels, leur passe les données dont
elles ont besoin depuis le store.

ces components métier appellent de leur cotré des composants génériques

si je fais une recherche, le scomposant génériques éocutent les events, et les
composants fonctionnels peuvent les écouter et réagir depuis. ils font une
action qui peuvent soit modifier le store directement, soitfaire un call API
qui changera le store en réponse


