---
layout: post
title: "HumanTalks April 2016"
tags: humantalks
---

BeMyApp. Come back from japan, did not organize anything, as a tourist

# Apache Flink

Thomas Le Naour, Consultant Octo
Flink
concurrent de spark, analyse de donnée en mémoire en streaming et enatch
projet de recherche devenu projet Apache en decemre 2014
marche en java, scala et python, mais python à la bourre

framework big daa

enregistre la data sur disque, l'avale rapidement et la stocke
puis peut faire du batch dessus pour anaylyser la donnée
DataStream API (data = event)
DataSet API (batch processing), machne learning, relationnel, graph processing
couche d'optimisaion par dessus
deployement en local ou déploiement en cloud (GCE/Amazon)

kafka fait de la collecte de donnée, scale beaucoup, prends toute la donnée en
masse. L'envoie dans Flink
Les store dans un Cassandra par exemple

possible de le clusteriser, et chaque partie process une partie de la donnée,
scaling horizontal sans problème
mais commodity hardware donc fault tolerance needed. possible de detecter qu'un
traitement n'a pas abouti, et le renvoie vers un autre. c'est le master qui
detecte ça. donc plus long à traiter, mais se traite

les master sont changeant, et si un master tombe, un autre peu prendre la place
(zookeeper)

++ avantages
realtime et streaming (alors que spark est en batch)
low latency, quelques millisecondes et performance
utilisé chez spotify et zalando
5.5 millions de levée de fond

-- défaults
moins mature que Spark
moins de communauté
600 commiters sur Sparks, 40 sur Flink


# Sprint

anciennement appellé design sprint
concretiser une idée en 5 jours
prototype animé, un peu de code, beaucoup de design
mais utilisable sur des test utilisateurs
time boxé en 5 jours
equipe pluridisciplinaire: ux, design, codeur (et un PO)
war room équipée

trouver la problématique
se mettre en situation parfaite
à la fin, liste d'ypohèses validés et des solutions pour avancer

"pour un bon produit, on ne cherche pas à répondre à un besoin, mais qu'on
réponds à des douleurs"

de manière individuelle, on dessine 8 élément de UI de comment on le voit
on mets en commun, on rafine, on vote sur les éléments
ensuite ça donne un dessin simplise pour aider le travail du graphiste
maquetes en une journée
résultat final simple, épuré, le plus clair dans les features

une journée de test
5 tests utilisateurs
assez pour trouver les erreurs principales
on reprends la liste des hypothèses de dépatr et on valide/invalide et nouvelles
idées à creuser

avantage: feedback rapides sans aucun développement
inconvénient: résultats semle pas différents d'une autre approche classique.
mets ça sur le dos de la première fois


# Defensive design

Woody Rousseau (@wrousseau)
dev chez theodo

pas d'imprevu, defensive design
37signals

techniques UX pour infomer le user des situation impréves et comment agir pour
en sortur

ex:
pas de reseau, pas de persmission sur les apps, pas de daa,e rrerur serveur

loading... comment faire patienter
montrer que ca charge et combien de temps il reste
fb montre des blocs vides avant d etout charger
montrer que les actions sont prises en compte (changement de couleur
d ebouton/loader, etc)
ne pas loquer l'utlisareur pendant le chargement, ne pas l'empecher d'aller
ailleurs pendant que ca charge

Vue défensive
informer si pas d'items, expliquer pouruqoi vide, et un CTA pour ajouter des
choses
deliveroo, le bouton log où les gens se trouvent pour savoir où il vaut mieux
ouvrir de nouveaux contrats

si une vue bloque parce que pas la permission, l'afficher avant de laner une
requete qui va fail
epxliquer pourqoi on demande cette permission
indquer au user comment faire la modification, porposer un lien vers les pages
de reference pour laisser le user le faire
difficile de changer les preferences une fois qu'on a refusé au début, l'aider
au max

informer tout de suite si pas de réseau, informer dès qu'on clique si pas de
réseau plutot que de fail timeout, proposer un reload de page ou autre

pré-afficher de splaceholder
afficher les données qu'on avait déjà en cache
afficher les données les plus rapides à chopper en premier
attention de ne pas recharger les données dans une formulaire, privilégier sur
les vues de read, pas de write

en cas d'erreur, indiquer une erreur générique, pas une stacktrace
afficher un bouton "reload", qui envoie des log

offline.js, capte quand pas de connection, quand ça revient


# Reverse side of VCs

Elaia Partners
Fond din'vestissement early stage dans le numeric

focus france, distruptive
as early as des projets de recherche
marche aussi sur les projets lancés qui ont des users mais pas de business
va de quelques centaines de milliers à quelques millions

criteo, teads, tinyclues, talent

VC Paradigm
"cherche les licornes" "chreches des twitter/googles"

VC est un entrepreneur raté, pas les couilles de faire la oite, donc prends les
sous des autres pour investir dans les boites des autres

les vc qui investissent comment ils jouent au loto, ça n'existe plus. ils sont
tech, ils siuvent, mais leur job reste de gagner de l'argent

cercher la distruption d'usage (food, leisure, etc)
chercher la distruption de technlogie (focus Elaia)
cherche des boites internationnales (internationalisables): taille du marché
importante pour les VCs

criteo était une boite de suggestion de produits culturels

équipe importante, plein de merdes arrivent, toujours, important de savoir les
gérer, c'est ça qui fait la valeur

1200 boites vues
250 rencontrées
25 analyzées (team, open-source, marché, etc)
6-8 investissement

1st meeting: 1h pour convaincre
2, 3, 4: 2h chaque, rencontrer la team, analyse plus profonde, appel à des gens
experts dans le carnet d'adresse
Ref calls
négo (on s'engueule, et si après s'etre engueulé on est toujours content, on
donne des sous)

VCs partagent les bonnes et mauvais experiences. IPO et liquidations
judiciaires. 13 ans d'XP, 50 boites à Elaia.
Aide à structurer les process, le board, la team

aide à l'internationalisation

le business plan ne sert à rien, ça ne va pas se passer
mais l'exercice de style permet de savoir si les gens ont les pieds sur terre ou
s'ils bullshitent
permet de reflechir au modèle






