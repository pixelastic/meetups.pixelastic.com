---
layout: post
title: "HumanTalks Juillet 2015"
tags: humantalks
---

_Note: For this post, I'll try to write in English. I'm now working in an
english-speaking company and I'm already writing emails in English to give
feedback on the HumanTalks sessions. I'm not used to write such lengthy posts in
English, though. Hopefully I'll get better at it the more I do it._

This session occured at Prestashop new office. Right near the Gare St-Lazare in
Paris, the office was brand new and really nice. For those that don't know,
Prestashop is the "Wordpress of e-commerce". They did a quick recruiting speech
at the start of the meetup, and they are looking for devops and front-end devs.

# OpenID Connect

The first talk was from my former colleague and mentor, François Petitit from
Octo. He talked about the France Connect initiative, pushed by the French
government to have some kind of state platform where all administrations could
exchange data in a uniformed way.

This ultimate goal is, as a citizen, that you do not have to fill the same form
asking for your name, address and social security number everytime you apply to
a state service. Also, this will remove the burden of having to provide all the
necessary papers to an administration. With the France Connect initiative, your
profile will be centralized and shared between all the state instances and they
could securely get documents from one another.

François worked on the main bricks of implementation and on one of the first
real-life implementations. France Connect wraps several identity providers and
identity clients. Each brick can be either one, or even both.

This mean that one brick could act as a provider of identity, responding to
requests of other bricks with data about a citizen. It could also act as
a client, asking data about a citizen to other bricks of the network.

The application on which François worked was both, so he add to implement both
sides. The protocol used behind the scenes is OpenId Connect which is already
ised by Google, Microsoft or Paypal. This must not be confused with OpenId.

OpenId was the ancestor, but it has now be deprecated and OpenId Connect is the
new standard, which is based on OAuth 2. The OpenId group is an official group
that can certify libraries and implementations of the protocol.

The OpenId Connect norm was finalized in 2014, with already some implementations
in production. When you sign-in with Google on any site, this is using OpenId
Connect. The spec defines ways to normalize the way sessions accross several
sites are handled, as well as how multi-identities on one site should be
treated.

François told us about the real-life scenario they were implementing. Let's
imagine you want to apply for a scholarship from you city website. Here, we are
dealing with three actors. You, as the main user. The city, through its website.
And an identity provider (to tell the city who you are).

You start by navigating to your city website. It asks for identification. You
can choose which site can give your identification from a list (it could be the
social security, or the tax department). You're then redirected to the website
you choose. You login there and you're automatically redirected back to the
initial website (the city one), with all your information already filled in. The
needed data was send by the social security/tax departement you logged to.

OpenId connect defines a set of standard to define a person, what fields should
be used. This makes exchange between different providers easier.

The current landscape of OpenId is full of libraries, used by big names and most
of them are officially certified. You need about 3 days of work to be able to
consume information from a provider. To become yourself a provider this can take
a bit longer. From their experience, what took the most time was not the
implementation it self, but being able to get access to the data in the first
place.

Nevertheless, it is important to note that the OpenId specs are very large and
some areas are not clear or you can do the same thing in very different ways.
This results in various client/provider implementation handling thing so
differently that they are not really compatible in the end.

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


