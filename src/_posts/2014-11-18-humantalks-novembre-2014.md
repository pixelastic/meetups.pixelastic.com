---
layout: post
title: "HumanTalks Novembre 2014"
tags: humantalks
---

Cette session des HumanTalks avait lieu chez nous, chez Octo. Je me suis occupé
de l'organisation, du coup j'ai pas beaucoup eu l'occasion de voir les
présentations en elle-mêmes. Du coup, mon résumé sera un peu moins touffu que
d'habitude (_ouf!_ dirons certains).

![Intro](/img/2014-11-18/intro.jpg)

## De l'idée au projet

{% youtube https://www.youtube.com/watch?v=qvaYpzTHRBc %}

On a tous des idées de projets qu'on a envie de faire sur notre temps libre.
Mais la plupart du temps, on profite d'avoir les coudées franches pour aussi
partir sur de bonnes bases, et en profiter au passage pour apprendre de
nouvelles technos. Finalement, on se retrouve avec une toute nouvelle stack,
qu'on ne connait pas du tout, on apprends sur le tas, on découvre les outils,
et deux semaines plus tard on a juste mis en place la stack technique et on n'a
pas commencé le projet en lui-même.

Du coup, Jonathan Beurel vient lui nous parler des pièges à éviter dans ce cas,
et comment aller droit au but de ce qu'on veut construire. Lui, sur son projet
perso, il a repris les briques qu'il utilise déjà tous les jours au boulot et
qu'il maitrise : Vagrant, OpenStack, Capistrano, Angular & Node. Son
hébérgement, il le fait facilement avec les GitHub Pages, et il utilise au
maximum l'écosystème _as a service_: SaaS, IaaS, PaaS.

Pour sa base de données, il a donc testé Firebase et Parse. Son retour
d'expérience c'est que c'est difficile de rajouter de la logique métier avec
Firebase, alors que c'est très facile avec Parse, sous forme de hooks
Javascript. Malheureusement pour lui, Parse fournit un SDK simple pour
Backbone mais pas pour Angular.

Pour le déploiement, il a utilisé Codeship. A chaque push sur son repo, il
execute les tests, et si les tests réussissent, il execute un script de
déploiement.

Au final, il a du js à tous les étages de sa stack et utilise un maximum
d'outils en -aaS pour mettre en prod. Ça lui fait gagner beaucoup de temps et
il utilise ce que d'autres ont déjà fait, pour lui se concentrer sur les
fonctionnalités propres à son idée.


## Protobuf

{% youtube https://www.youtube.com/watch?v=IIwQGb3hQCU %}

Pour le coup là, j'ai été occupé toute la présentation à réceptionner les
pizzas, je n'ai malheureusement rien vu !


## Formateur indépendant, mais où est Charlie?!

{% youtube https://www.youtube.com/watch?v=SXiOtd8hvsI %}

Mathieu Robin, formateur indépendant depuis peu nous parle de l'aventure que
c'est de se lancer dans la formation tout seul. Pour lui il y a de grosses
arnaques dans le milieu de la formation, avec un budget de 14 milliards fourni
par l'État pour les formations en entreprises. D'après lui, il suffit
d'attester avoir participé à une formation, et que le formateur atteste l'avoir
donné, pour toucher un part du gateau. Il a donc voulu en faire parti...

Des clients l'appellent pour lui demande des formations, mais sans savoir
exactement la date, la durée, le nombre de personne. En gros, il faut être prêt
à partir en formation rapidement.

Pour être officiellement reconnu comme formateur, il faut un numéro de SIRET,
ce qui est facile à obtenir, mais il faut aussi un numero d'agréement de
formation, qu'on n'obtient qu'une fois qu'on a fait une vraie formation, payée
par une société. Le soucis étant que tant qu'on n'a pas fait cette formation,
la société paye le prix fort, il est donc très difficile de faire cette
première formation.

Mathieu Segret, co-fondateur de l'organisme de formation HumanCoders a rajouté
un mot à la fin, pour aller dans son sens. Passer formateur nécessite de
naviguer dans un vrai dédale administratif. Chez HumanCoders ils ont automatisé
un maximum de choses pour remplir automatiquement les papiers au format PDF, ce
qui leur rends la vie plus agréable.

## Meteor

{% youtube https://www.youtube.com/watch?v=Kirit9Xl6ZM %}

Ici aussi, je n'ai pas pu assister à la présentation, trop occupé à préparer le
buffet pour discuter après coup.

## Conclusion

Dommage pour moi, je n'ai pu voir qu'une partie des talks, pris dans
l'organisation. J'ai pu un peu discuter après coup aussi, et on a bien mangé
(avec de beaux gateaux d'anniversaire des HumanTalks).
