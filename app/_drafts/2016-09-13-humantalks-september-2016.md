---
layout: post
title: "HumanTalks September 2016"
tags: humantalks
---

For the September session of the HumanTalks, Sfeir graciously hosted us.
Everybody was coming back from vacations (including us, organizers) but we
managed to find 4 speakers and a place to host in a short amount of time. Tasty
bagels and a nice terrace under the warm sky of September is a perfect way to
start a new year.

## FedEx days

First talk was about an experiment done at NanoCloud, something they call FedEx
days. They did not invent the principle, and you should be able to find articles
on the subject online.

The goal of FedEx days is to bring coworkers together in a timeboxed
session to work on a specific subject of their choosing. They marked a day in
their calendar, and one week before they asked everbody to suggest ideas of
projects that could be built. Projects need to bring some value to the company,
and need to be something you can actually build (no wild dreams here). Then
everybody pick a suggest and form a team of about 4 people to work on it. Having
no more 4 people in a team creates a climate of healthy competition.

In their iteration, most of the people chose a group based on their personal
affinities with other, so there was no diversity in the teams. It's
something they would like to change for the next event.

But what was nice was to bring together in the same team one that have been here
for the past years and one that got hired a couple weeks before. It helped the
new hires to better know their coworkers and the product. They plan to make it
an "official" part of the hiring process for the next hires.

I'm personnaly unsure this is something I'd like to do on a regular basis. Or,
let me reformulate. I think small team of friendly coworkers working on small
features that bring value to the company should be what every day should look
like. But actually immerse new hires in a team when they join, so they can know
their coworkers better, have a deeper understanding of the product and bring
something to the company seems a good idea.

## ES Next Coverage

Second talk was way more technical, about a code coverage tool. Oleg, from
Sfeir, is the developer of esnext-coverage. We saw how testing code is
important, but also how having coverage of the tested code is an indicator of
test quality.

Not everybody does testing, and even less people do coverage. Configuring the
whole test/coverage stack is time-consuming and often discouraging. Oleg
tried to make it as simple as possible with esnext-coverage so developer
couldn't hide behind excuses.

The tool allow the exporting of the results in `json` or `HTML` as well as any
custom formatter. This is an improvement over Istanbul that apparently have
a limited list of built-in formatters. The default HTML formatter creates
a single page application that you can use to browse through the code.

We then saw how all this works in practice, including a live-code of the
instrumentation phase, where the initial code is transformed into another code
that will "count" each time a line is executed. The whole demo was done in AST
explorer, an online AST (Abstract Syntax Tree) console. 

Basically every call to a method, or every variable assignement is replaced
with a call to a method that will increment the count associated with the
current line.

Interesting talk, I always like to see people write code that write codes.
I like the meta aspect of it. Also, Oleg is a great speaker which made
understanding the underlying concepts easier.

## Taking the hard out of Hardware 

not so hard, look like a lot a lot like software actually
Dev Evangelist @ SigFox
Alex Bucknall

hardware is not hard
invisible to te eye looks like complicated
concepts are similar to computer scien concepts
classes, objetc,s inheritance, the same as in oop

integrated componnets / power sources / active / passive
PLL Fm demodulation system, is what is used in radio
lookseasy when explained. srukk so many concepts I don't get. igh frequency, low
frequency, voltage, 

resistor stop things from catching fire
capacitator smoth voltage
simulate so you don't break things (TDD-style, build a proto before building if
for real)
do not fear the breadboard

like in software, basics are easy, but can get complicated. in that case,
companies build high-level components to help

dev kits to comunicate through API and callacks

## C'est quoi un daily ?

Thibaut Cheymol. BAM
"Quoi hier? Quoi today? Quel problème? au regard du sprint goal"
permet de "savoir" purquoi on bosse cette semaine

debout. canalyse l'energer auour des personnes
15mn, parce que si plus c'est chiant
etre à l'heure, déclarayif, pas de discussion, ne pas se couper
mais surtout se préparer

parler de "done"
parler feature "j'ai fait en sorte que..."
etre concis
pas d'ordi

problèmes en 3 tous
1. quels soucis (tout le monde)
2. actions (tout le monde)
3. résultat des actions d'avant (tout le monde)


