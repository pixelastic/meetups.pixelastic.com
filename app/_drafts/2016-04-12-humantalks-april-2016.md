---
layout: post
title: "HumanTalks April 2016"
tags: humantalks
---

This month HumanTalk was at BeMyApp. I had a bad _a priori_ about BeMyApp.
I always saw them associated with bullshit hackathons, but I went to a Paris.js
meetup at their place and discussed a bit with organizer and I felt like it
would be a good place to be hosted in the end. They are specialized in
organizing hackathons, and they did organize bullshit ones, though.

I just came back from Japan a couple of days before the event, so I mostly came
as a regular attendee, not an organizer this time.

# Apache Flink

First talk was very technical and about Apache Flink, by Thomas Le Naour, from
Octo. I knew Flink only through the [is it big data or pokemon] quizz, so it was
helpful to dig a bit more.

Flink is a direct competitor to Spark, allowing data analysis in streams and in
batches. It started has a research project in 2014 and became an Apache project
after that. It works in Java, Scala and Python, but the Python API is clearly
lagging behind the other twos.

The optimal setup has Flink pluggued behind a Kafka, to process data as it comes
by and store it on the disk (usually in a Cassandra DB). Once the data is
stored, Flink can do batch analysis on it (machine learning, graph processing,
etc). In practice it means that you have two different Flink APIs. One is for
the initial streaming of data (aptly named the DataStream API) and the other is
for the following batches (DataSet API).

You can deploy it locally on your machine or in clusters on Amazon or GCE. While
in a cluster, each node of the cluster will process a small part of the data in
parallel. This allows for easy scaling by adding new nodes to the cluster as you
need them. It is designed to work on commodity hardware, so it includes some
kind of fault tolerance. If a node is considered dead in the cluster (its last
job did not succeed, or reached a timeout limit), the job is sent to anotre
node. Once the bad node recover, it can get back in the cluster. When something
like that happens, the whole treatment still succeed, but is delayed by the time
it takes to detect it and fallback to another node.

To orchestrate all this, one of the nodes is set as the master of the cluster.
In addition to the default data treatment, it also handles the detection of
faulty nodes. As master can also fail, you need ZooKeeper on top of them to
elect a new master if one fails.

In a nutshell, Flink is still far from its main competitor in term of community
and support, but it handles streaming while Spark does not. It is currently used
in production as Spotify and Zalando, but if you already have something running
on Spark, there is no need to switch as it would mean a complete rewrite.

# UX Sprint

The second talk, by Antoine Pezé, was about a UX method to prototype a product
from scratch quickly, including mockups and user testing.

It's goal is to validate hypothesis about a potential products in 5 days, by
developing a first usable prototype. The first two days are spent discussion
about the project, putting ideas together, sketching a few main UI elements, and
voting for the feature that everyone think are the most important.

The team involves a UX designer, a UI designer, a developer and a Product Owner
from the get go, and they will work together for 5 days. They have their own
room, with pen, paper and whiteboard.

They start by imagining the "perfect situation", where nothing can come wrong
(perfect user, perfect data, perfect everything). They start by writing a list
of hypothesis about their product (what they think it will fix, what are the
current user frustrations, what they think the users will do with the product,
etc). At the end, they will assert or remove those hypothesis based on the
result of their first user tests.

As Antoine said:

> To make a great product, you do not have to answer to a need, you have to
> answer to pain points.

The first mockups focused on at least 8 UI elements that are really important in
the product, and the UX/UI designers can start creating mockups. These mockups
are really simple, straight to the point, and are then shown to users, in the
field, to get their feedbacks during one day. 5 tests on 5 different people is
enough to get the main issues, no need to do more.

Then they take all their initial hypothesis, validate or invalidate them, and
this gives them a very strong basis on which start building the real project.

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






