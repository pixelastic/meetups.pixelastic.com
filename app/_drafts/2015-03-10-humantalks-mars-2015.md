---
layout: post
title: "HumanTalks Mars 2015"
tags: humantalks
---

valtech, bisuzatge human talks

# test des performances
deploiement continue maintenant
plein de ressources sur les mees machines, implication d'un sur un autre
cloud. tests sur boite données, avec cloud boite elastique si paye plus cher.
Donc inverse, on réduit les couts pour payer moins

2 process : on fonce, on teste pas OU coché la case, test de perf (mais pas iso
prod).  Garbage in, garbage out.

Objectif : ça marche en prod.
- vérifier en dev que semble bien en prod
- monitoring de prod
- travail devOps
- optimisation des consommations de ressources

tests de perfs seulement sur tunnels critiques : dispo, temps de réponse,
tunnel de paiement, sselon business model

Design for failure. Tests pas assez. Ça va planter en prod. Need flexible, need
scaling, need agile. Feature flipping pour désactiver features pour baisser
traffic.

Résilient (opérateur de backup pour paiement), mode dégradé. Monitoring et
logs. Logs génériques ops, logs applicatifs devs. devOps.

limiter les besoins en représentativité. Petite app, mais pas de fuite mémoire,
extrapole en cloud, calcul des couts. Pas besoin de tout le SI. Identifier les
SPOF, les transformer avec des backups de résilience. Identifier scénarios de
locsk, qui bloquent les uns les autres.

Dark launch. Push to prod iune feature, mais invisible à l'user, mais lancée.
Duplication des flux vers une version dark. Si plante, light side fonctionne
encore. Mais data, logs, informations pour darkside.

Démarrage graduel. Push features à partie de users. Configuration par %, sur
demande des users ou sur liste représentative, A/B testing. Pas de full deploy.
Feature FLAG indispsnesable

Caution sur la version des datas. Etsy le fait, précautions sur data. Pas de
rollback, rollforward, need deploy rapide.

Chaos Monkey. Tue des éléments aléatoirement. Vérifie que fonctionne encore, ou
moins. Permet de tester le monitoring aussi. Ça va peter en prod, autant que ce
soit nous qui le pétions.

devOps, Agile, Feature Flipping <=> Tests de perfs

# Holacration, travailler sans manager

Olivier Le Lan, Soat, Coach Agile.

"Le management est trop important pour le laisser à une seule personne". Ex,
dev, plein de managers, plus ou moins compétents.

management, séparerl les pensants des excutants. pas naturel, c'est une
technologique, donc fini par etre dépassée.
agile remets en caise tpot ça, autoorganisé, intelligence collective. marche
mieux.

Du coup, Manage useless en agile ?
Holacratie. Zappos, pas de jobs titles, pas de managers, pas de hierarchy.
-1500 managers.
holarchie: entité qui est une entitée et le tout en même temps
ensemble d'atomes, qui forment des organes, des organismes

réunis sous forme de cercles. avec d'autres cercles, dans d'autres cercles.
alignés vers le WHY de l'enterprise

séparation role/individus. plusieurs roles par individus, plusieurs idnividus
avec le même role. peut etre dans pluseurs cercles (cercle coach/cercle front)

Roles :
Facilitateur, Secrétaire, 1er Lien, 2em Lien.

Réunions:
Stratégie, Gouvernance (réorganisation au sein de chaque cercle), Triage (todo
list, what must be done)

REX Soat. Manager, 4 coachs. Manager parti. Testé.
1. Aligné sur la vision du coaching entre managers
2. Convaincre la direction. Experimentation bénéfique pour l'entreprise
3. Identifier les roles (autres cercles: comm, dg, rh, etc)
4. Répartition des interfaces dans l'équipe avec ces poles
5. Réunion mensuelle. Stratégie/Gouvernance/Triage.

Comment trouver le consensur dans un groupe ? On ne trouve pas le consensus, on
cherche le consentement. Consensus: tout le monde dit oui, Consentement:
personne ne dit non.

Question looooooongue. Quelle question ? "Ça me rassure, il y a toujours un
manager". "Oui, mais pas un individu; mais un role. Pas plus de 10% du temps,
et change". Change pas toute une boite d'un coup, commence quelque part, puis
s'étends.

# REX IONIC

Loic Knuchel, dev front-end, entrepreneur. Trop plein d'idées, lui ou des
cliuents. Souvent des applis mobiles. Plein d'idées sont sur mobile, car
toujours avec soi

fmwk UI mobile, basé sur Angular. HTML, CSS, JS + Angular. Fourni styles par
défaut + directives angular pour composants mobile;

plein de composants typique mobile. list, slider, boutons, etc. orienté iOS,
mais style Material en cours. tourne dans cordova pour le link vers le tel.

directives de header, list, avec classes css qui vont bien avec
collection-repeat fait du lzayloading des éléments (remplace le content sans
changer le dom). pull to refresh. tabs de bas de page. popover

ligne de commande ionic pour générer icones, splahscreen, livereload, webview
plus rapide, vues android/ios sur le browser

ng-conf 2015. annonces ionic. v1.0 sortie officiellement. stabilisé.

Donne vraiment envie pour proto une petite idée, un POC facilement.

offline. plugins cordova, libs tiers pour ça, pas dans ioncic.

moins rapide que natif, mais pas assez pour s'en plaindre. plus facile à faire
pour des fronteux, mais deploy plus facilement.

peut ajouter un crosswalk : chrome dernière version dans l'app mais rajoute du
poids.

# Intrapreneuriat

Chris Parola, co-fondateur d'elCurator

Ok ! On parle. Mais, suis-je un intrapreneur, c'est quoi l'intrapreneur.

indivus qui monte t une nuovbelle prganisation ena ssociatoin avec une grande
entreprise.

départ d'une idée. la curation, les gens connaissanet. mais personne le afait
sur les contenus techs chez octo. bac à sable lean startuip, rails, ouvertiare
sur octo, fait en temps perso.
2 ans plus tard, c'était juste un projet perso. puis création d'organisation

commencé par une soirée hack day, bieres ° code.

Mais une fois dans Octo, qui paye ? nom de domaine, mraque, un peu d'infra.
Eux, payé de leur poche, parce que ca les intersse et veulent pas etre
rattachés à octo

quand on fait la bascule ? pourquoi deux ans sans octo ? a faire quand on
a envie de faire à temps plein, et/ou quand on commence à avoir des clients.

quelle structure juridique. Rien. Aucune régle. y a pas de statu spécial.
a faire en bonne intelligence avec l'entereprise. négocier la propriété
intellectuelle. Eux, créé une SAS, répartition des parts.

Mais qui à quoi ? conviction que ca marche, tout le monde se bat pour des bouts
de gateaux, séparation de qui à apporté quoi. Octo a abondé en plus, comme uen
levé de fond. Conseil, discuter des parts ava,nt que ça marche, plus dur de
négocier une fois que ca fonctionne.

Enjeux pour l'entreprise. Innocer. Permet de se dibetsifier aussi. Permet de ne
pas perdre les gens aussi, qui sinon risquent de partir.

Avantage d'etre chez Octo ? Si convaincu que va gagner de l'agent, pourquoi
rester chez octo. Enjeu majeur, séucirté. Salaire pendant toute la durée;
minimiser le risquer. permet de bénficier des coll_gues, écosusem, locaux,
carnet d'adresse

Les risques ? si vrai entrepreneur qui croit à 100%, alors la sécurité on s'en
fout. Si pret à vivre de pas beaucop, pas bonne diée, trop de confort pour
perdre des parts de sa société. Perte de liberté à caque levée de font, partage
des parts. SI pas majorité, théoriquement remplacable, on peut vous rajouter
des couhes de management, pas le dernier à choisir.

Question ouf. Temps donné par Octo pour projets persos, mais si marche, plein
pour la poche d'Octo. Drole de rumeur, me semble pas vrai ni dans l'intro ni
dans la conclusion.

