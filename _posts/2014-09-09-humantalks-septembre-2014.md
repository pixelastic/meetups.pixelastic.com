---
layout: post
title: "HumanTalks Septembre 2014"
tags: humantalks, tdd, hackathon, reactive
---

Pour Septembre, c'est Mozilla qui a bien voulu accueillir les HumanTalks. Au
programme, 4 talks, dont le dernier par votre serviteur. On commence par une
explication de la polémique "TDD is dead" de DHH, suivi d'une présentation d'un
mode de développement type hackathon, puis une présentation de RxJava.

## TDD is (not really) dead

Présenté par [Nicolas Mérouze](http://nicolasmerouze.com/), qui nous parle de
la fameuse phrase de DHH, "TDD is dead". Ce qu'il voulait dire par là c'est
qu'il y a mieux que de faire du TDD (ie. des tests unitaires avant d'écrire le
code), il est préférable de faire des tests d'acceptance avant d'écrire du
code. Comme ça on ne teste pas les rouages internes de comment ça marche, mais
on teste directement que ça marche.

Les tests d'acceptance sont des tests en black box, sans connaitre
l'implémentation. On vérifie juste que le comportement attendu s'execute. On
continue d'écrire nos tests avant le code, mais on fait des tests beaucoup plus
génériques. On rajoute des tests unitaires quand la logique individuelle
devient compliquée, mais cela devient l'exception et non la règle.

Les tests d'acceptance prennent des tables d'inputs en entrée et vérifient les
outputs. On fait passer les mêmes tests, mais sur des jeux de donnée
différents. Ca commence à attendre ses limites quand il y a plein de
variations, on ne peut pas tout rejouer à chaque fois, il est alors plus
intéressant de faire des tests plus spécifiques et donc de revenir aux tests
unitaires.

Les tests d'acceptance n'autorisent pas non plus les mocks, on teste le système
dans son ensemble. Là encore, si un mock est nécessaire, on retourne aux tests
unitaires. Mais le propos principal était qu'il vaut mieux commencer par tester
au plus large, et si vraiment le besoin s'en fait sentir redescendre aux tests
unitaires, mais pas l'inverse, cela fait gagner du temps.

Globalement le propos de la présentation était un peu compliqué à comprendre.
Il a fallu plusieurs questions de l'audience pour que je comprenne vraiment de
quoi il retournait.

## Coder en mode commando

[Evan Genieur](https://twitter.com/CodersInBlack) nous a parlé d'une méthode de
travail qu'il est en train de tester. Il veut travailler uniquement avec des
passionnés, sur des laps de temps courts, et dans des endroits sympathiques.

Pour ça il s'inspire du principe des (bons) hackathons, où pendant quelques
jours une bande de passionés part de rien pour produire quelque chose. Pas
besoin de penser à se faire à manger, ou de devoir rentrer chez soi, tout est
fourni directement pour qu'on puisse se concentrer sur le projet à rendre.

Il propose donc aux entreprises, généralement des start-ups, ou pour des POC de
plus grosses sociétés, de prendre 4 jours au vert avec 4-5 personnes dans des
maisons louées sur AirBnB.

Les projets réussis sont fait par des gens qui sont passionnés par ce qu'ils
produisent, qui croient en sa valeur, et qui le comprennent. Pour ça il faut
améliorer la colocalisation, mettre les devs, les designers et les clients dans
la même pièce pour itérer rapidement et obtenir du feedback. Rester travailler
tous les jours au même endroit, avec les mêmes personnes n'aide pas à devenir
créatif. Par contre créer une bulle d'efficacité autour du projet en le
protégeant de toutes les interférences extérieures, et en lui donnant le
maximum de potentiel permet d'obtenir des livrables très rapidement.

Il teste encore plusieurs compositions d'équipe, plusieurs durées, mais ce qui
semble pas mal fonctionner actuellement ce sont des équipes de compétences
diverses. Un développeur senior pour prendre les décisions techniques et
profiter de son experience dans les choix, mais qui ne code pas forcément
beaucoup. Un jeune développeur, qui généralement restera à travailler sur le
projet après l'opération commando, qui va coder et prendre en main le projet.
Et un développeur intérmédiaire, qui est là pour faire la liaison entre les
deux, s'assurer de la qualité du code, servir de référent au junior. Un chef de
projet, pas forcément technique, mais qui connait le métier doit impérativement
aussi être là et être logé à la même enseigne que le reste du groupe.

Sur chaque run, il faut compter une demie-journée de brief au démarrage et une
demie-journée de debrief à la fin. Le but n'est pas forcément d'avoir un
produit fini à la fin du run, mais d'en avoir fait le maximum en un temps
limité, pour profiter de cette bulle de compétence et de passion.

Deux jours, le format hackathon traditionnel est trop court. En deux jours on
a le temps de faire un POC, mais pas de faire les finitions pour qu'il puisse
évoluer. 5 jours, c'est à dire une semaine complète c'est trop long, on
s'essoufle et on n'en fait pas plus en 5 jours qu'on ne puisse en faire en 4.
La durée optimale pour le moment selon lui est de 4 jours, ce qui laisse
3 jours de dev complet et 1 journée de brief/debrief.

La règle d'or est le "No Bullshit". Tout le monde doit faire bien son job, être
transparent sur ce qu'il fait et avoir une vision de ce que font tous les
autres. On vit et on travaille au même endroit, cela crée des liens. Ce n'est
pas adapté à tous les développeurs, certains ne peuvent pas travailler avec une
piscine qui leur temps les bras à coté, d'autres apprécient de piquer une tête
de temps en temps pour se rafraichir les idées et retourner bosser ensuite. Il
faut trouver les profils qui s'épanouissent le plus dans ce genre d'atmosphère.
Le but est de créer un moment unique, pas comme d'habitude, dépaysant, et
d'être au maximum "in the zone".

J'ai beaucoup aimé cette manière de travailler. Je sais que je travaille mieux
quand je suis dans un endroit étranger (ni chez moi, ni dans un bureau), et que
je n'ai pas à m'occuper des événements annexes (téléphone, trajet retour, pause
déjeuner, réunions, etc). Perso, j'aimerai beaucoup participer à ce genre
d'initiative.

## RxJava

On repasse sur quelque chose de moins funky, une présentation de Brice Dutheil
et David Wurteisen sur RxJava.

Je m'excuse d'avance si je massacre le contenu de la présentation, mais ne
faisant pas de Java (ni de reactive) les informations restaient assez
abstraites pour moi.

RxJava est une implémentation en Java des reactive extensions. Initiées à la
base par Microsoft, puis open-sourcées, elles ont ensuite été reprises par
Netflix dans leurs systèmes.

L'idée principale est que la plupart de nos appareils aujourd'huis possèdent
plusieurs cœurs, qui executent leurs traitement chacun dans leur coin mais qui
doivent réussir à les faire communiquer d'une manière uniforme, comme si ces
résultats venaient d'une seule et même source. Le même principe s'applique dans
un réseau quand une réponse est en fait un aggrégat de réponses de plusieurs
systèmes. La manière principale de communication dans un tel système est une
communication par événement.

RxJava fournit une abstraction élégante, composable, flexible et puissante sur
ce système. On peut manipuler des séquences d'évenement, quelque soit leur
source (réseau, calcul, interaction UI de l'utilisateur) et les traiter comme
s'il elle venaient toutes d'une même source et réagir sur leurs événements.
RxJava permet de filtrer, merge, effectuer du map/reduce sur ces séquences.
