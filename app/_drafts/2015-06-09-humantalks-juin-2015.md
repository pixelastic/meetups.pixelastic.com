---
layout: post
title: "HumanTalks Juin 2015"
tags: humantalks
---

Viadeo
120 personnes, plus dans les ~90

# RAML
manière de documenter son API rest
tache dégligée, parce que chiant à faire
là on va simpligier la documentation, et lui donner plus de valeurs, et surtout
d'avoir des tests automatisés de documentation

Restfull API Modeling Language
Yaml

#%RAML 0.8
title, version baseURI

/sessions:
  displayName: Collecion of talks
  /{id}:
  displayName: A talk session
  /talks
  displayName: talks of the session

définirion des methodes autorisés et en texte ce que ca fait

définition des queryParameters, donner des types, obligatoire, default,
description

configurer les parametres du bodyen POST, on eut définr le type (ej JSON ou
POST). On définir le schéma du JSN atteendu, et un example

définition des types de réponses, 200, 404, le contenu de la réponse, des
examples

possibilité de faire de la mutialisatoin, définir des listes, inclusion de
fichiers, headers http, basic auth

générateur de documentatons html à partir de ça
générateurs de code backend, frontend, pas encore tous bien aboutis, plus du
proto
test d'implémentations API vs Spec
parseurs dans différents langages

alternativces: swagger, API Blueprint, IO Docs

api github, facebook, déjà définies. peut rajouter des tests pour vérifier si
chane, mais ne verra as de nouveaux ajouts, juste des changements de
types/échecs d'appels.

# Sociologie appliquée au développeur

quand plus de problemes tecniques, problemes humains
tout le monde va dans des direcions différentes, mais sont pas cons, pauvent pas
toutjours le dire, mais nt leus raisons

12 effets

Principe de Peter, si on donne des promitions quand bon, fini par plus etre bon,
mais ne se fait dépromouvoir
regarder si bon sur sa place

Dunning Kruger effetc. Quand on est compétent, on voit que c'est dur, qu'on ne
sait pas, ça prendre du temps. Les gens nuls vont direct, sont surs d'eux et
sont nuls
lucide sur ses skils

Hawthorne effect
mesure d eproductivté des ouvris. on mets plus de lumières pour mieux bosser,
donc on augmente encore plus et encore plus. ais on baisse, pareil, mais en fait
c'est juste le changement d'env qui change leur manière de faire.
changer le bureau, poster, pièce, etc ça change, donne de nouvelles idées
changer ses habitudes

XY problem
pouruqoi on deteste les geeks. Comment on fait sous windows? achete un mac,
pasif agressif
débutant qui pose question.
quelque pose question pour répondre X, mais un aute voir que autre probleme et
réponds à ce prolème
communiquer rour le temps

Effet d'audience
faut il surveiller, demande tout le temps où ça en est
si simple, on glande, alors surveille
si complexe, lui lahcer les baskets
simple ping

Ringelman effect
plus un groupe est gros, moins il est efficace
overhead de coordination
dilution de la responsabilité
manque de motivation et de coordination parce que faute de ersonne
hiérarchie light

Woozle effect
Légendes urbaines deviennent des factoides
à force d elire toujours la même chose, on finit par le croise
la répétition fait se transformer les mensinges en réalité
attention au cargo cult

Matthew effect
les pauvres deviennet plus pauvre et les riches plus riches
si kevin qui sait tout fair,e on lui demande tout le temps
si quelqu'un fait tout, on gagne du temps à le voir, et après il n'a plus le
temps. délégation, pas toujours au plus rapide, monter en compétence
équipe diverse, ne pas virer, monter en compétence

Catfish effect
sardines fraiches cheres, sardines plus vieilles moins cher
mettre un poisson chat devient plus fraiche
émulation, compétition fat moner les compétences
rajoute un maestro dans la liste

Attribution Error
Lui toujours con, mais là sympa
Lui tojours sympa mais là con
Existe pas

Effet demo
Montrer par l'exemple
Faire les trucs chiants avec les autres

Walkman effect
aime pas les geeks, parce que geeks et gens normaux, avec casque sur les
orreilles, associaux, aiment pas les gens
remettre dans un environnement controlé, ferme les interactions

# De l'UX dans mon équipe Agile

Le role d el'ux n'est pas d'améliorer avec une checklist. on se base sur les
utilisateurs, si l'outil ne réponds au besoin des utilisaters, c'est un échec

avant, on lui demandait de faire des aquettes, presta qui deveit fare des
maquettes pendant deux mois, ave un assage sur le terrain, puis livre les
maquettes et fin du projet pour lui

maintenant chez octo
plusieurs personnes, mais pas intéressant, ce qui est interessant c'est les
fleches entre les gens, d'éhcnager, de communiquer
aller discuter avec son UX designer, s'il y en a un
demander aux développeur le type de livrable qu'ils veulent

prendre l'avance, pettes itérations, une ité d'avance mais pas plus
aide le PO à choisir les priorités en fonctoin des retours. va sur le terrain,
donne des inuts au PO
discuter avec tout le monde, management visuel
et intégrer le feedback utilisateur dans le produit le plus tot possible

appli pour conducteurs de camion citerne, trés specifique, donc aler sur le
terrain
dans le depot, demande si smatphone,. savent pas, veulent bien qu'on leur en
donne
rappellent qu'à la raffinerie, téléphone doit etre éteint pour raison de
sécurité
du coup, informations capitales sur le terrain, pour structurer l'appli. si on
prends pas ça, on fait un truc dans la mauvaise direction qu'il faut tout
changer ensuite

agir sur la storymap, changer les prios en fonction des observations. On lui
epxlique qu'ajouter les news sur la boite dan sl'appli n'interesse pas les
utilisateurs

war room, UX et développeur cote à cote, queluqes hrures, améliorent
l'intégration trés rapidement ensemble. plus gro,s contraste, couleur, etc.
permet d'échanger bien, boost dans la compréension, bypass les US, l'admin, etc
collaboration en management visuel. Il va sur le terrain, et fait des personnés
(passe de "les users" à "Marc, 45 ans, 10 ans d'experience")

tests utilisateurs dès le début du projet, permet de voir pour de vrai comment
ils utilisent. le font n'importe comment. mettre ses trippes sur la table, se
confronter au réel, voir comment on l'utilise pour de vrais

aller observer, ne pas faire avec eux, ne pas les prendre par la main, les
laisser faire. excellent

L'UX n'est pas une checklist
Échanger avec son UX designer
Challenger les maquettes
Aller Observer les utilisateurs

goodui.org

# Wild Code School
Une école de codeurs au verts
Romain Cœur
La Loupe. Eure et Loire entre Chartes et Le Mans, loin de Paris.
INgénieur, web dev.

Dernière promo finie en Avril, nouvelle en Septembre.
formarn courte et intense au dev web et mobile en 6 mois
ambitieux, mais gens ambitieux dans les profs et les élèves

5 ans d'études, appris plein de trucs. INgénieurs et Autodidactes, mais rien
entre les deux
dev web, ça se pratique de loin, pas beosin d'etre à Paris
mais toutes les écoles sont à Paris ou dans les grandes villes, vient à paris
pour faire son école, parle avec des entreprises, reste développer à Paris, pas
envie de partir en région pour le salaire

gare à la Loupe, 1h30 depuis Mparnasse, plusieurs fois par jours
promo beta, tout age, tout horizon
19 à 43 ans, milieux banque, serveur chez mac do, assistante de direction,
boulangerie, menuiserie

formation centrée sur la pratique, réalisation de projets dès la deuxième
semaine.
théorie, exo, praique, nope.
pas de cours ou presque, des hackathons au lieu des examps, des aterliers
organisés par des professionnels, coach en communication corporelle, agile,
deezer
un seul cours par semaine

exam, 24h pour faire quelque chose

Formateur, pas enseignant. Délivre as le savoir, accompagne les élèves, cohésion
d'équipe, dédramatisation de l'échec. Vrais projets, avec vrais clients et
facturés.

Temps fort

> Ce que tu dis c'est de la merde.
Alex 19 ans, serveur chez mac do, vs ex assistante de direction. Formateur, qui
doit dédramatiser et apprendre à parler de manière pro

Coups de stress/laisser-aller.
Eleves stressés, DEVAIENT réussir car reconversion et autres assistés par
papa-maman. Choisir le juste milieu entre trop compliqué et trop facile, pour
garder le flow et la motivation

Grosse erreur, un examen noté. Élèves dégoutés du système de notation de
l'éducation nationele. Pris comme une sanction, comme une attaque, pas comme un
truc à améliorer.

70% en CDD, CDI ou Stage.

Bien: autonomie, intiiave, veille
Moins bien: algo, théorie

Développer c'est bien de savoir faire, mais aussi ien de comprendre comment ça
marche.

mode d'enseignement hybride pour la prochaine formation, sorte de MOOC
+ ateliers pratiques. Explication de ce que c'est de coder, permet de voir
  eux-même si ça les intéresse ou pas, car pas d'ide de ce que c'est coder.
  Ensuite "recrutement", pour voir la motivation

Pas des ingénieurs BAC +5, développeurs qui savent s'intégrer et progresser.

Cours de code 8-10 ans, meetup découverte du code, hackathon (e-agriculture
week-end prochain), recrute formateur.

6000€, mais solution pour ceux qui peuvent pas se le permettre.

Aide du maire, internat, emploi, pépinière d'entreprise sur place.

Technos: PHP, Ruby, Node.
HTML, CSS pour les bases, en ligne. Site statique.
Choix PHP, Ruby, Node sur toute la formation.
PhoneGap, accueille tout ce qui vient des élèves.




Question: Nom de l'école. Innovéduc, Simplon Village.
Question: Langages appris, UX, Sociologie, API














