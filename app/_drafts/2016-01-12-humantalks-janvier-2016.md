---
layout: post
title: "HumanTalks Janvier 2016"
tags: humantalks
---

Note: I'm actually writing this blog post several months after the event, so my
memory might not be the freshest here.

Anyway, we had 4 talks as usual for the HumanTalks, hosted at Deezer this time.

## Apache Zepellin

{% youtube https://www.youtube.com/watch?v=NaPj52fJQoU %}

First talk was by Saad Ansari, with an introduction to Apache Zepellin. Their
use-case was that they had a huge amount of tech data (mostly logs) and they had
no idea what to do with it.

They knew they should analyze it and extract relevant information from it, but
they had so much data, in various forms, that they didn't really know where to
start. Sorting them manually, even just to find which data was interesting and
which was garbage was a very long task that weren't able to do.

So they simply pushed them to Zeppelin. It understand the global structure of
the data and display it in tables and/or graphs. It basically expect CSV data as
input and then lets you use a SQL-like syntax to do requests on it and display
visual graphs. The UI even provided a drag'n'drop feature for easier refinement.

I was a bit confused as to who the target of such a tool was. Definitely it was
not for any BigData expert, because the tool seem too basic. It wouldn't fit for
someone not technical either because it still requires to write SQL queries.
It's for the developer in between, to get an overall feeling of the data,
without being to fine-grained. Nice to get a first overview of what to do with
the data.

As the speaker put it, it's the Notepad++ of BigData. Just throw garbage CSV and
logs in it, and then play with SQL and drag'n'drop to extract some meaning from
it.

## The Infinite, or why it is smaller that you may think

{% youtube https://www.youtube.com/watch?v=xg1b6_XXyAo %}

Next talk was a lot more complex to follow. I actually stopped taking notes to
focus on what the speaker was saying and trying to grasp the concepts.

It was about the mathematical definition of the Infinite and what it implies,
and how we can actually count it. Really I cannot explain what it was about, but
it was still interesting.

At first I must say I really wondered what such a talk was doing in a meetup
like the HumanTalks, and was expecting a big What The Fuck moment. I was
actually gladly surprised to enjoy the talk.

## Why is it so hard to write APIs?

{% youtube https://www.youtube.com/watch?v=-7LWklt079c %}

Then Alex Estela explained why it is so complex to build API, or rather, what
are the main points that people are failing at?

First of all, REST is an exchange interface. It's main and sole purpose is to
ease the exchange between two parties. The quality of the API will be as good as
the communication there is between the various teams that are building it.

REST is just an interface, there is no standard and no specific language or
infrastructure pattern to apply. This can be intimidating, and gives so many
possible reasons to fail at building it.

Often people build REST API like they built everything else, thinking of SOAP,
and exposing actions, not resources. Often, they build an API that only expose
the internals of the system, without any wrapping logic. You also often see APIs
that are too tailored for the specific needs of one application, or on the other
hand that can let you do anything but built with no specific use-case in mind so
you have to retro-engineer it yourself to get things done.

The technical aspect of building an API is not really an obstacle. It's just
basic JSON over HTTP. Even HTTP/2 does not radically change things, it will just
need a few adjustments here and there, but nothing to hard. The issue is the
lack of standards, that give too many opportunities to do things badly. You can
use specs like Swagger, RAML or Blueprint, they all are good choices with
strength and weaknesses. Pick one, you cannot go wrong.

There is no right way to build an API in terms of methodology. The one and only
rule you have to follow is to keep it close to the users. Once again, an API is
a mean of communication between two parties. You should build it with at least
one customer using it. Create prototypes, iterate on it, use real-world data and
use-cases, deploy on real infrastructure. And take extra care of the Developer
Experience. Write clear documentation, give examples on how to use it, give
showcases of what you can build with it. Use it. Eat your own dog food. Exposing
resources is not enough, you also have to consume them.

Make sure all teams that are building the API can easily talk to each other in
the real world and collaborate. Collaboration is key here. All sides (producer
and consumer) should give frequent feedback, as it comes.

To conclude, building an API is not really different than building any app. You
have to learn a new vocabulary, rethink a bit the way you organize your actions
and data, and learn to use HTTP, but it's not really hard.

What you absolutly need are users. Real-world users that will consume your API
and use it to build things. Create prototypes, stay close to the users, get
feedback early and make sure every actor of the project can communication with
the others.

## Why do tech people hate sales people ?

{% youtube https://www.youtube.com/watch?v=oObnt3CvDRs %}

son job c'est de vendre



