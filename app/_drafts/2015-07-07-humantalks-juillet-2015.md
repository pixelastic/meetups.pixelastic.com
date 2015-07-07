---
layout: post
title: "HumanTalks Juillet 2015"
tags: humantalks
---


Chez prestatshop
wordpress du excommerce
recrute du devops, front-end, et validation des modules


# OpenID Connect

François Petitit, Octo (des octos tous les mois depuis...)

France Connect, consultant Octo
Etat plateforme, poussé par l'état
étatpropose de splatefomr pour développer des applications pour render sercice
aux citoyens

permet de déléguer la gestion des idenirés à d'uatres briques.
fournisseur de service (par exemple mairie), qui demandent à des fournisseurs
pour les identités

ex formulaire à remplir et envoyer par la poste
mais avec france connect, on se login avec un de nos comptes d'idetité. soit
impots soit assurance maladie avec les logins mot de passe d'ameli
ensuite déjà identifié sur la mairie, avec les champs pré-remplis

mais d'autres infos qu'ameli ne connait pas, alors on peut autoriser la CAF
à récupérer les infos depuis d'autres sources. Chacune faisant référence sur
certaine sdonnées

France Connect est à la fois client et fournisseur selon les providers, donc
teste dans tous les sens. Derrière openid connect on des géants du web comme
google, microsoft, paypal, etc

Fondation pour OpenId à la base, gérer identité. Deprecated, devient
OpenIdConnect, basé sur OAuth 2. Peuvent certifier des librairies et des
implémentations.

Norme finaliseée en 2014 avec des exemples en prod. Sign in with google est de
l'open id connect. Normalisation des sessions multi-sites, des multi-identités
sur un site, etc

3 acteurs. utilisateur, mairie et fournisseur d'identité
délégation odentfication. du browser redirgé vers la mairie
renvoie vers le site de départ
puis des appels de web services pour obtenir des informations, types sont
normalisés pour les récupérer, standard entre plusieurs fournisseurs

plein de librairies, certifiés, utilisées par plein d'acteurs majeurs. 3 jours
d'implémentation en gros pour consommer les informations. Pour devenir
fournisseur, le plus gros travail c'est de récupérer les informations depuis sa
base.
"Pari" sur SAML, là dessus ou bien sur du sécifique.
Personne ne l'avait vrament fait il y a un an, résultat bon pari car ça marce
trés bien.

Piège à savoir. Norme très large, plusieurs façons de faire la même chose, ou
trous dans la norme. Attention donc aux librairies qui peuvent ne pas supporter
la même feature d'un coté ou de l'autre.

openid.net
dev-franceconnect.fr (doc de comment fait sur franceconnect)

# Make your business SPOF-less

Co-fondateur de Jumboweb. Font des applis métier web et mobile sur mesure.
Petite boite, 4 personnes.

boite qui grossit, moins de temps chacun, travail en remote, comment faire pour
que tout fonctionne bien, même quand quelque chose pète

tout est spof, mot de passe, climatisation, electricité, internet. Et chacun est
un spof s'il disparait

combien de projet on plante si on disparait, 1, 2, 10 rpojetc, on mets la boite
par terre?

## Spof structurel

téléphone, local, machine
prévoir des fallbacks

un serveur principal, quelques backups. serveur répliqué régulièrement sur un
autre datacenter

## Spof par omission

mot de passe, accès aux comptes, agenda, finances, etc
Keepass + Dropbox (ou Lastpass, Dashlane)

Tout partager, partager es todos, les bug tracker, evernote, slack, etc

## SPOF métier

Faire plus que travailler ensemble, faire comme si les collègues étaient
interchangeables

code pas dans une suele tete, peer programming systématique et code review avant
d'aller en code review
tout le monde touche à tous les projets
mais un responsable projet par client pour garder un interlocuteur

best quality, tout le lde travaille partout, tout le lnde apprends, les grands
expliquent aux jeunes, pas de blocage de projet


bon c'est cool mais on le sait déjà, mais on a la flemme

chaque jour travaillé génére du temps de veille
temps nécessaire pour etre rentable

incite à faire du perr programming( pas bien compris pourquoi, mais semble
marcher). Permet d'avoir un "capital temps" pour aller en rendez-vous client,
glander, faire de la veilel. Si prends pas assez de temps de veille, "deviens
mauvais".

objectif est d'améliorer la qualité de vie plutot que de chercher les profis
maximums. se vendent à l'heure, savent combien un projet est vendu, donc savent
quand ils sot rentable

Freckle? Time racking API. ON enclenche un timer quand on coemmence, et on peut
récupérer les données pour faire les calculs

Possibilité de faire du peer programming à distance avec TeamViewer ou hangout,
peut etre plus productif en partageat un écran


## REX Développement mobile

John Carmack, créateur de DOOM, facile de lancer des applications sur de petites
plateformes, car petite platfroem, moins de choses à gérer.

a voulu faire son jeu sur android, mais compliuqé besoin d'etre pluri
disciplinaire

donc a créé une petite appli qui passe en vibreur quand au boulot, volume chez
soi, silence sinon

download appli concurrente pour voir si bonne idée. teste son idée avce appli
plus complete. bonne idée. va faore appli plus simple avec juste un use case

teste la UI avec des slides. cgens comprennent pas
teste avec des icones, marche mieux
fait un proto avec une feuille de papier, permet de simpliier encoe la UI

Google propose trop de docs pour faire des apps on s'y perds. Facile à dev, du
java (qu'il connait) et IDe qu'il connait.
compliqué de faire enregistrer son appli, prends du temps

si crash, pas d'infos sauf si quelqu'un appuie sur report quand crash (personne
ne le fait) donc intégrer un reporter intégrér

trouve un prix; 0.79€
on le trouve pas facilement dans le playstore
ccherche à cpntacter des journaux, mais lettre morte, pas trés interssant

augmente le prix. 0.79€ semble de mauvais qualité. augmente, mais change pas
grand chose sur les ventes.
impossible de rendre une appli gratuite vers payante sur playstore. la passe en
gratuit. 15 installations d'un coup

s'incruste sur twitter, meetups, fete des meres, chinois

veut pas rajouter de la pub dans l'appli

demande à l'audience comment faire pour que l'appli soit plus téléchargée

très honnette

# Tails

Jean Baylon
Distrib Tails
but est de passer inaperçu quand on est sur internet
permet aux journalistes de passer au travers de la censure
pack de base de reporters sans frontières
snowden approved
11 000 users, 20 developpeurs
financé par TOR, Debian et FPF

changer d'habitude
inutile d'utiliser tails pour achete sur amazone en donnant son adresse

tails spoof l'adress MAC
TOR et Firefox configuré de base
pidgin encryté

aircrack ng pour tester la sécurité du wifi
bitcoin wallet

se lance depuis une clé usb, tout en mémoire, aucune trace sur la machine
possibilité de mettre un clavier virtuel pour éviter le skeylogguers

permet de faire plein de choses sur internet, éthique et illégales



demo
demande un password root
camouflage d'UI qui ressmeble à windows 8
spoof MAC camouflé par défaut
quand éteint, vide la mméoire, n'écrit rien sur le disque sans le consentement
de l'utilisateur


