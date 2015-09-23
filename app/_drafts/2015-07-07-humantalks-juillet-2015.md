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

## Make your business SPOF-less

The second talk was from one of the founders of Jumboweb, a french web agency of
4 people. The mostly do web and mobile custom applications. Their company is
growing, which makes them have less and less time. They decided to start working
remotely and gave us some feedback on how to make it go smoothly, even when
something goes wrong.

They realized that they had a lot of SPOFs in the way the did things. When you
start looking for SPOFs, you find a lot of them. The A/C can be a SPOF during
summer. Internet access and electricity certainly are. And each of the 4 members
of the company are SPOFs also if they disappear.

They started to count how many projects would fail if one team member had an
accident? 1, 2, 10? And would it put the whole company down? They had to find
a way to limit that.

First of all, they added fallbacks to the tools they often use. Having a fixed
telephone line in case the mobile one stops working. Backup all their work from
their laptop machines to a decentralized server automatically, in another
location.

Then, they put all the passwords in a Keepass file, shared in their Dropbox.
They gave access to the Calendar and Financial information to everybody. Any
tool one of them was using was also opened so anyone could use it, even if they
did not need it at the time. This includes TODO lists, bug trackers, Evernote,
Slack. The goal was that everybody had access to the same information.

Then, they started sharing their work. They wanted to do more than simply
working together, they wanted to be able to have one of them working on the
project of another easily.

They do systematic peer programming, so that the code of one project of feature
is not in only one person head, but at least in two. They do code review on
everything, at first with only the two developpers involved, then with all the
team. That way, everybody works on every projects, and when a critical bugfix is
required, people at least know where to start. But still, they keep only one
privileger interlocutor for each project when speaking with their clients.

They found that this was providing the best quality of their work. Everyone is
able to work from anywhere, everybody learns, seniors can teach juniors and no
project is ever stalled.

But our jobs requires that we do a lot of technology watch to keep us afloat in
this ever-changing world of web development. So, to be sure that all of them had
enough time to read and learn while keeping the company running they created
a kind of reward system.

Each worked day earn employees "free time" that can be used for technology watch
without pressure. They did the math and know the minimum number of worked
hours that will keep their company running. Anyone has a couter of free time
available and you're encouraged to use it. I must admit I did not completely
understood the algorithm used here, but they did an open-source webapp to keep
track of all the time spend on work and gained (they use the Freckle API to keep
track of time).

They decided that the goal of their company was the well-being of the 4 of them.
More time for family, more time for personnal stuff, while still earning enough
money to live with enough confort. They get payed by the hour, they know what
the budget for a project is, so they can easily know when they're making
a profit and when they're not.

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


