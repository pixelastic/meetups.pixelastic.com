---
layout: post
title: "HumanTalks January 2016"
tags: humantalks
---

_Note: I'm actually writing this blog post several months after the event, so my
memory might not be the freshest here._

Anyway, we had 4 talks as usual for the HumanTalks, hosted at [Deezer][1] this
time, with food courtesy of [PaloIT][2].

## Apache Zepellin

{% youtube https://www.youtube.com/watch?v=NaPj52fJQoU %}

First talk was by [Saad Ansari][3], with an introduction to [Apache
Zeppelin][4]. Their use-case was that they had a huge amount of tech data
(mostly logs) and they had no idea what to do with it.

They knew they should analyze it and extract relevant information from it, but
they had so much data, in various forms, that they didn't really know where to
start. Sorting them manually, even just to find which data was interesting and
which was garbage was a very long task that weren't able to do.

So they simply pushed them to Zeppelin. It understand the global structure of
the data and display it in tables and/or graphs. It basically expect CSV data as
input and then lets you use a SQL-like syntax to do requests on it and display
visual graphs. The UI even provides a drag'n'drop feature for easier refinement.

I was a bit confused as to who the target of such a tool was. Definitely it was
not for any BigData expert, because the tool seem too basic. It wouldn't fit for
someone not technical either because it still requires to write SQL queries.
It's for the developer in between, to get an overall feeling of the data,
without being too fine-grained. Nice to get a first overview of what to do with
the data.

As the speaker put it, it's the Notepad++ of BigData. Just throw garbage CSV and
logs in it, and then play with SQL and drag'n'drop to extract some meaning from
it.

## The Infinite, or why it is smaller that you may think

{% youtube https://www.youtube.com/watch?v=xg1b6_XXyAo %}

Next talk by [Freddy Fadel][5] was a lot more complex to follow. I actually
stopped taking notes to focus on [what the speaker was saying][6] and trying to grasp
the concepts.

It was about the mathematical definition of the [infinity][7] and what it
implies, and how we can actually count it. Really I cannot explain what it was
about, but it was still interesting.

At first I must say I really wondered what such a talk was doing in a meetup
like the HumanTalks, and was expecting a big WTF moment. I was
actually gladly surprised to enjoy the talk.

## Why is it so hard to write APIs?

{% youtube https://www.youtube.com/watch?v=-7LWklt079c %}

Then [Alex Estela][8] explained why it is so complex to build API, or rather,
what are the main points that people are failing at?

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
need a few adjustments here and there, but nothing too hard. The issue is the
lack of standards, that give too many opportunities to do things badly. You can
use specs like [Swagger][9], [RAML][10] or [Blueprint][11], they all are good
choices with strength and weaknesses. Pick one, you cannot go wrong.

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

What you absolutely need are users. Real-world users that will consume your API
and use it to build things. Create prototypes, stay close to the users, get
feedback early and make sure every actor of the project can communication with
the others.

## Why do tech people hate sales people ?

{% youtube https://www.youtube.com/watch?v=oObnt3CvDRs %}

Last talk of the day was from [Benjamin Digne][12], coworker of mine at
[Algolia][13]. He explained in a funny presentation (with highly polished
slides⸮) why dev usually hate sales people.

Being a sales person himself, the talk was much more interesting. Ben has always
worked in selling stuff, from cheeseburgers to human beings (he used to be an
hyperactive recruiter in a previous life).

But he realized that dealing with developers is very different from what he did
before. This mostly come from the fact that the two worlds are actually speaking
different languages. If you overly stereotype each part you'll see the extrovert
salesman only driven by money and the introvert tech guy that spend his whole
day in front of his computer.

Because those two worlds are so different, they do not understand each other.
And when you do not understand something, you're afraid of it. This really does
not help in building trust between the two parts.

But things are not so bleak, there are ways to create bridges between the two
communities. First of all, one has to understand that historically sales people
were the super rich superstars of the big companies. Techies were the nobodies
locked up in a basement somewhere.

Things have changed, and the Silicon Valley culture is making superheroes out of
developers. Still, mentalities did not switch overnight and we are still in an
hybrid period where both sides have to understand what is going on.

Still, the two worlds haven't completely merged. Try to picture for a minute
where the sales people office are located at your current company. And where the
R&D is. Are they far apart, or are they working together?

At Algolia, we try to build those bridges. We first start by hiring only people
with a tech background, no matter their position (sales, marketing, etc.), which
makes speaking a common language easier. We also do what we call "Algolia
Academies" where the tech team explain how some parts of the software are
working to non-tech employees. On the other hand, we have "Sales classes" where
the sales teams explain how they built their arguments and how a typical sales
situation is. This helps each part better understand the job of the other part.

We also have a no-fixed-seats policy. We have one big open space, where every
employees (including founders) are located. We have more desks than employees
and everyone is given the opportunity to change desk at any time. Today we have
a JavaScript develop sitting between our accountant and one of our recruiters,
and a sales guy next to an op, and another one next to two PHP developers.
Mixing teams like this really helps avoiding creating invisible walls.

## Conclusion

The talks this time were kind of meta (building an API, sales/tech people, the
infinity) and not really tech focused, but that's also what makes the HumanTalks
so great. We do not only talk about code, but about everything that happens
around the life of a developer. Thanks again to Deezer for hosting us and to all
the speakers.


[1]: http://www.deezer.com/soon
[2]: http://palo-it.com/
[3]: https://twitter.com/lefreelance
[4]: https://zeppelin.incubator.apache.org/
[5]: https://twitter.com/fredyfadel
[6]: http://www.slideshare.net/fredyfadel/linfinie-ou-lhistoire-de-la-mathmatisation-de-la-logique
[7]: https://en.wikipedia.org/wiki/Infinity
[8]: https://twitter.com/alx_estela
[9]: http://swagger.io/
[10]: http://raml.org/
[11]: https://apiblueprint.org/
[12]: https://twitter.com/Bndigne
[13]: https://www.algolia.com/
