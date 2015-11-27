---
layout: post
title: "HumanTalks 3 Ans"
tags: humantalks
---

For the third year anniversary of the HumanTalks, we did a special event. We
were hosted at the Société Générale headquarters, in one of the most beautiful
conference room I've ever seen. There also was more attendees than usual, and we
gave some goodies, T-shirts and JetBrain licenses at the end.

It was also the first session with Antoine Pezé as our official new team member.

And for me, the first time I went to the SG building. I must say I had a bad
feeling about the place at first. I feel like La Défense is really a creepy
place, with everything I don't like about moder society. Big gray buildings that
tower over you, and everything seems to have been constructed for giants. As
human being, you feel like you're out of place. Big tall towers with thousands
of people working in them, all dressed the same. The only sources of light were
from the ads and the mall windows. Grey, work, consume.

But then, in all this ocean of sadness, we met with Adrien Blind who is in
charge of organising the meetups at the Société Générale. And I discovered that
the SG is actually much more interesting in the inside than the outside. They
are quick to iterate, have DevOps all the way from top to bottom, and really
know and apply Agile and Software Craftsmanship philosophy. We'll see more about
that in the last talk.

## Front-end testing

The first talk was done by William Ong, former colleague from Octo. He presented
the front-end testing ref card they developped. It's a physical cardboard flyer
that lists all the different kind of tests you can do to your front-end (from
unit testing to performance testing and security testing), with examples, tools
and advices.

The content of the refcard is really really great. It gives a nice overview of
what can (and should be done) today, but also advices on the costs of each of
them and when to implement them or not.

The web frontend landscape evolved a lot in the past years, and it is getting
more and more complex with more and more logic being moved from the back-end to
the front. To keep it sustainable, we now need to use the same kind of tooling
we're used to use on the backend: testing harnesses.

Unit testing are a must have. He won't even develop on that subject because it
is obvious. No good quality code can endure the stress of time without unit
testing. Code that isn't unit tested is not finished.

But then, came all the other kinds of tests. When should we use them? Which
tools should we use? Are they really needed? All the other tests are harder to
put in place, so you should only add them if it helps you fight a pain you
already experienced. No need to add those kind of tests in advance if you never
experienced any issue on that part. They are costly to start, costly to
maintain, so the benefit must be higher than the cost.

For integration testing (here also named end-to-end testing or functionnal
testing), you should only add them on the critical path of your users. The one
that generate money (subscription funnel) for example. This kind of test will
indirectly test the whole stack. It will warn you when the core functionnality
you're testing is broken, but won't really help you diagnose where the issue
could come from (database, back-end, front-end, etc). These tests are also the
longer to write and will yield false positive whenever you update the
design/markup.

Talking about design, it is also possible to test your design. Using CasperCSS,
you can take screenshots of your whole page or specific parts of it and check
that they did not change with the previous commit. This will help you diagnose
changes to the website created by a seemingly unrelated CSS commit. Those tests
can be unvaluable, but they will also yield false positive results when a design
change is actually expected. As for the integration test, limit yourself to the
real main parts of your app.

You can also test for common security exploits, like the top 10 OWASP. Some
tools can test them on you website and warn you of any vulnerability. Another
approach can also be to ask for a security audit, and I personnally also
recommend opening an open hacker bounty program, like HackerOne.

In the end, all tests share one benefit: they give you the freedom to make the
code evolve without being afraid of breaking things. It gives you complete trust
in the code.

It was William first public talk, and the room was quite impressive with more
than 120 attendees, so I guess he freaked out a bit. There were a few silences
where you could feel that William was intimidated, and he looked a lot at his
slides to give him some assurance. In the end, the message was here and it was
interesting, and we'll be happy to have him on stage another time if he wants.

## How to win at TCG with code



Gary Mialaret
TCG, trading card game
mais on n'échange plus, le point commun est duel, affrontement, et ressources
à gérer

Magic, cartes "inutile" car ne servent qu'aux ressources. réponse générale est
~24, mais on ne sait pas pourquoi

distance hyper géometrique, donne des valeurs pour avoir la bonne main
mais ne prends pas en compte le mulligan
pour ça, besoin de plus de code et de lancage de plein de mains pour savoir
faut connaitre les rgles et se fixer des regles de mulligan

peut simuler avec des regles simples des combat de deck contre un goldfish, pour
voir à quel tour on gagne en moyenne

dev all the things
savoir poser les bonnes questions, savoir ce qu'on cherche, comprendre la
réponse, permet au final de mieux comprendre le jeu

## Instant

Peter Pirolli & Stuart Card
Information Foraging

chasse l'info online, similaire que quand onchassait avant
spots de chass,e plusieurs endroits, je cherche ici ou je vais au suivant ?
idem quand on cherche online, quantité d'info par rapport à unite de temps

R = G / (Tb + Tw)

on atteinds une limite pour trouver l'info
si google va plus vite, passe moins de temps sur le site

# Culture Craft

comment réveiller son organisation
stratégie ne peut aller à l'encontre de la culture

voulait se casser, pense devenir un vieux con parce que "c'était mieux avant"
puis, BBL, coding dojo, open-source, donne envie de se secouer, de faire des
trucs
lui et la SG se sont réveillés pour redonner cette motivation

Reveil. Se réveiller reveiller les autres
faire appel à un ami, comme un BBL
si on vieux dans la boite, on nos écoute pas

si plein de monde, premier arrivé, prmeier servi, laisser les gens avoir envie
de venir

coding dojo, kata de code, 1h, 1h30, en peer
debrief ensuite
ouvert à tous, peut etre intimidant, faire dédramatiser l'ambiance
venir avec ses clavirs/souris parce que clavier mec...

"Mec, faut que tu vois ça"
porjeter un talk, on débat ensuite
3g téléphone, grand écran, enceintes portatives

Book club
un chapitre par semaine
on debrief ensemble

lunch mob
on code ensemble le midi, on push sur github

faire le buzz, photos, twitter, etc

la route est longue
pas bouger les boulets (ceux qui achetent un smartphone quand il n'y a plus que
ça), bouger les au


