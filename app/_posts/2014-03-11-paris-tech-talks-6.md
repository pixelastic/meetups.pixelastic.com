---
layout: post
title: 'Paris Tech Talks #6'
tags: techtalks
---
## Introduction

Le premier Tech Talk que je faisais, et sans doute le dernier. Tout était trop
commercial. Bon ok, ça se passait chez Critéo dont le business model est basé
sur la pub, mais quand même. D'ailleurs, il n'y avait bien que la présentation
de Critéo qui était interessante, les autres étaient essentiellement des
présentations commerciales pour vendre son produit, elle-même coupées par des
pages de pub (des gens qui montent 2-3 minutes sur scène pour présenter leur
produit).

Je sais que les organisateurs ont essayé de faire des efforts pour les sessions
suivantes, mais je n'y suis pas retourné pour autant.

## Machine Learning at Criteo

Criteo achete de l'espace publicitaire sur les sites internet et gagnent de
l'argent quand quelqu'un clique bel et bien sur la publicité en question. Ils
ont donc besoin de grosses capacités de machine learning pour savoir s'ils
doivent acheter une publicité ou non. Leur calcul est un calcul de probabilité
pour savoir si un utilisateur va cliquer s'ils leur affiche une publicité, et
si l'investissement vaut le coup par rapport au prix de la publicité. Tout leur
business est basé sur le modèle de prédiction et la vitesse à laquelle ils
peuvent répondre.

Ils ont besoin de choisir la couleur, la font, l'image, le produit à mettre en
avant dans la publicité en quelques millisecondes le temps que la page soit
chargée. Ca représente environ 30 milliars de requetes par jour.

Ca leur créé donc une base de parametres énormes, dans laquelle ils font de
l'analyse pour trouver les corrélation de tout ces paramètres pour réussir
à deviner ce qui marchera bien ou non. Leur élément principal est la vitesse de
réponse. L'algo n'a pas besoin d'etre parfait à 100%, mais il a besoin d'etre
rapide. Au pire, afficher une pub qui ne crée pas de transformation alimente
quand même leur modèle prédictif sur ce qui ne marche pas et leur permet
d'apprendre. Cette notion d'apprentissage n'est pas manuelle, il y a bien trop
d'éléments à prendre en compte pour réussir à ce qu'un humain puisse les
modéliser, tout est automatisé.

Plus ils envoient de données à leur moteur, plus celui-ci prends du temps à les
traiter. Ils apprennent donc progressivement quelles sont les données qui ont
de la valeur et celles qui n'en ont pas pour ne garder que les données qui
rentrent dans leur modèle.

Pour rajouter un peu de difficulté, ce n'est pas parce qu'un utilisateur va
cliquer qu'il va acheter pour autant. Ils donnent l'exemple des petites
culottes, qui sont un article sur lequel tout le monde va facilement cliquer,
mais peu de personnes vont finalement les acheter. Pour pouvoir valider leur
modèle de prédiction, il doivent attendre 30 jours pour savoir si un achat
a bien été effectué après le clic. Leur modèle de prédiction se prends donc une
latence de 30 jours automatiquement.

Globalement le talk permettait rapidement d'expliquer à une audience qui n'y
connait pas grand chose en big data et machine learning (moi, donc) quelles
étaient leur problématique et de voir ce que ça implique. Ca parait très
intéressant et ils en ont profité pour passer une annonce de recrutement. Si
travailler dans la publicité ne fait pas de mal à votre éthique, les challenges
techniques sont très très interessants.

## Hadoop

Je passe très vite sur la présentation d'un commercial de Google qui nous parle
d'Hadoop, mais qui finalement ne fait que nous montrer le tutoriel du site en
version accélérée (et qui plantait). Ca n'apportait pas grand chose, je serai
allé plus vite à essayer moi-même le tuto.

## Mobile Image Recognition

Puis vient un gars qui plonge directement dans le vif de son sujet en nous
expliquant ses problèmes, avant même de nous expliquer ce que fait son appli.
Il faut quelques minutes pour remettre les pièces du puzzle les unes avec les
autres et on comprends que c'est une application de reconnaissance visuelle
d'affiche de film. On lui envoie une photo d'une affiche, il en fait un hash,
il le match dans une DB et il nous retourne des infos sur ce film.

Ils ont des soucis de latence pour envoyer l'image pour la processer sur le
serveur. Du coup, ils déportent une grosse partie de la logique sur le client.
La reconnaissance et la création du hash est créée directement sur le device,
et ils gardent une DB locale des films les plus demandés directement en local.
Comme ça la connection n'est utilisées que pour les cas les moins connus.

La core library est en C99 pour pouvoir être utilisée aussi bien sur iOS que
sur Android. C'est extrémement rapide, il leur faut environ 30ms pour traiter
10.000 images. Leur core est donc portable, indépendant de la technologie, ce
qui leur a permis de coder une appli google glass en une demie-journée.

