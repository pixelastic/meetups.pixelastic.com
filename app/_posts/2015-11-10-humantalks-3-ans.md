---
layout: post
title: "HumanTalks 3 Ans"
tags: humantalks
---

For the third year anniversary of the HumanTalks, we did a special event. We
were hosted at the [Société Générale][1] headquarters, in one of the most
beautiful conference room I've ever seen. There also was more attendees than
usual, and we gave some goodies, T-shirts and [JetBrain][2] licenses at the end.

It was also the first session with [Antoine Pezé][3] as our official new team
member.

And for me, the first time I went to the SG building. I must say I had a bad
feeling about the place at first. I feel like La Défense is really a creepy
place, with everything I don't like about modern society. Big grey buildings that
tower over you, and everything seems to have been constructed for giants. As
a human being, you feel out of place. Big tall towers with thousands
of people working in them, all dressed the same. The only sources of light were
from the ads and the mall windows. Grey, work, consume.

But then, in all this ocean of sadness, we met with [Adrien Blind][4] who is in
charge of organising the meetups at the Société Générale. And I discovered that
the SG is actually much more interesting in the inside than the outside. They
are quick to iterate, have DevOps all the way from top to bottom, and really
know and apply Agile and Software Craftsmanship philosophy. We'll see more about
that in the last talk.

## Front-end testing

The first talk was done by [William Ong][5], former coworker from Octo. He
presented the [front-end testing ref card][6] they developed. It's a physical
cardboard flyer that lists all the different kind of tests you can do to your
front-end (from unit testing to performance testing and security testing), with
examples, tools and advices.

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
already experienced. They are costly to start, costly to maintain, so the
benefit must be higher than the cost.

For integration testing (here also named end-to-end testing or functional
testing), you should only add them on the critical path of your users. The one
that generate money (subscription funnel) for example. This kind of test will
indirectly test the whole stack. It will warn you when the core functionality
you're testing is broken, but won't really help you diagnose where the issue
could come from (database, back-end, front-end, etc.). These tests are also the
longest to write and will yield false positive whenever you update the
design/markup.

Talking about design, it is also possible to test your design. Using
[PhantomCSS][7], you can take screenshots of your whole page or specific parts
of it and check that they did not change with the previous commit. This will
help you diagnose changes to the website created by a seemingly unrelated CSS
commit. Those tests can be invaluable, but they will also yield false positive
results when a design change is actually expected. As for the integration test,
limit yourself to the real main parts of your app.

You can also test for common security exploits, like the top 10 OWASP. Some
tools can test them on your website and warn you of any vulnerability. Another
approach can also be to ask for a security audit, and I personally also
recommend opening an open hacker bounty program, like [HackerOne][8].

In the end, all tests share one benefit: they give you the freedom to make the
code evolve without being afraid of breaking things. It gives you complete trust
in the code.

It was William first public talk, and the room was quite impressive with more
than 120 attendees, so I guess he freaked out a bit. There were a few silences
where you could feel that William was intimidated, and he looked a lot at his
slides to give him some assurance. In the end, the message was here and it was
interesting, and we'll be happy to have him on stage another time if he wants.

## How to win at TCG with code

I don't know how many coffees [Gary Mialaret][9] took before coming on stage for
the next talk, but he seemed to be really happy to be here and was almost
jumping and running while speaking.

Gary told all us about TCG (Trading Card Games), and how those kind of game are
no longer really about trading ([Hearthstone][10] for example, does not allow
trading of cards). The main common ground of all those games is that it's a duel
between two players, where each player create its deck of cards before the game
and must carefully balance the number of monster/spell cards (that can make him
win), with the resource cards (that are needed for using the monster/spell
cards).

Empirically, every hardcore Magic player knows that a balanced deck needs 24
resource card, but Gary wanted to get to the math behind it to prove that it
was the most optimal number.

He introduced us to the hypergeometric distribution mathematical function, that
can calculate the probability of drawing a hand with at least `n` "good" cards,
given the number of cards in a hand, the number of cards in a deck, and the
ratio of good/bad cards in a deck.

While applying the method to a basic Magic deck we do __not__ get the 24 cards
we talked about earlier. This is because this method does not take into account
another Magic mechanism called Mulligan, that lets you discard all your
starting hand and start with a new one instead. To simulate that, he had to
resort to a bit more coding. He generated thousands of different hands,
discarding them when they did not meet his expectation and managed to get back
to the magical 24 number.

He went even further, simulating basic Magic rules, playing against what is
called a goldfish (a player that does not respond to attacks, and basically does
nothing). He went on creating adaptive algorithms, applying something similar to
genetic selection on deck creation. He starts with simple deck, make them play
against goldfishes, then keep the one that works best, apply a few random slight
changed (a bit more of that card, a bit less of that one), and make them play
again until he reached the best possible deck.

His final conclusion is that we should not hesitate to put some of our developer
mind in action to solve things that are not related to development. The most
important thing when we want to solve a problem, is to know which questions
we're looking answers for. Magic is a very complex game, it is not possible to
code every possible rule and generate every possible deck to find the ultimate
one. But by focusing on one specific problem, we can learn a lot about the
underlying principles and this, in turn, helps us devise a better deck.

## How our brain reacts to instant

The next talk was done by Gaetan Gachet, with whom I work at Algolia. He talked
about the way our brain reacts to instant feedbacks.

His presentation was explaining the theory of [Information Foraging][11]. The
main idea is that the way we are today looking for information on websites is
similar to what our ancestors were doing when hunting.

When you hunt you know a few interesting places where you know you might find
game. But sometimes, not game shows up, so you wait a bit more. And more. And
more. Until you decide that it is not worth waiting any longer, and that you
might actually just move to the next place you know could be a good hunting
place.

But this second place is far away, and it will take you hours to get there, so
that's why you wanted to wait here a little longer. But now, you decide that
your current spot is not good enough and you'll take the chance to move to the
next one.

What happened in your brain was actually a simple equation of risks and return.
At the start it seemed more interesting to stay, to see if you could find
something here, because you know that this place should have animals to hunt.
But the more you wait without results, the more you're thinking that moving to
the next place might actually be more interesting. Until you decide that you've
wasted enough time and actually move.

When looking for information online we act the same. We first go to a first
website, because Google told us that it might have the information we are
looking for. We are searching their list of products, trying to find the one we
want. We are skimming pages and pages of results until we realize that what we
are looking for is not here, and that maybe we'll have more luck going to the
next website.

This would not have happened if either the first website let you easily find
what you're looking for, or would easily tell you that it does not have what
you're looking for. It is just a matter of how much information you get compared
to the time you spend.

In that analogy, Google is actually the whole territory the hunter can access in
a day, while each website is a known hunting zone. But because Google is so
fast, moving from one hunting zone to the next is actually really easy. And so
you are more easily convinced to try another hunting zone if you did not find
what you were looking for in the first minutes or second of hunting.

The paradox here is that the faster Google is, the less time people will spend
on your site, because they know they can easily go search in another website if
yours does not yield relevant results quickly.

That is why it is very important to give quick and relevant results to user
searches when they come to your website, because you have competitors, and users
will easily jump to a competitor website if they do not find what they are
looking for on your website. Being the top first result on a Google page search
is not enough.

## Culture Craft

Last talk of the day was a nice story about what happened at Société Générale in
the past years. Some people wanted to "wake up" the organisation. They felt like
the overall strategy of the company was not adapted to its current culture. And
that the current culture was slowly dying because of that.

The speaker actually confessed that he wanted to leave the company at that time.
But he stopped short when he realized that his thinking was actually just
something along the lines of "it was better before", which is what stupid old
men are usually saying. And he didn't want to become a stupid old man, so he
decided to do something about it.

He started organizing BBLs internally, where they will book a room during lunch
and one of them was going to talk about a subject he was passionate about while
the other would listen to him (and eat their lunch). They also organized some
coding dojo, where everybody in a room would work on the same computer problem,
one after another, and everybody helping others.

But it did not started that fast. At first he was alone. So he asked a friend if
he would be interested in listening to him speak at a BBL. The friend was ok,
and talked about it to other friends. So they did it. They did not tell the
management, or booked a room. They just took an empty room and did it. They knew
that because they were some of the oldest developers in the company, nobody
would listen to them. So they just did it.

The first BBL was a success. The room was small, so not everybody could come
in. Those who couldn't come in wanted to come to the next one. It started to
work on a "first come, first served" principle and gave the event a nice image.

They also created some events codenamed "Dude, you have to see this!". In those
events, they take a room and one person opens a Youtube/TEDTalk video he liked,
everybody watches it, and then everybody discuss it.

And they kept creating things like that. Things like lunch mob, where they
gather together for lunch and code on a project and push everything at the end.
They posted photos internally, put some on Twitter and in the end, what started
as a single initiative is now a well-known fact of how things are working at the
SG.

His main advice was simply to make it happen. Some people won't like it, so
don't invite them and don't try to convince them. Focus on those that are
interested and build something for them and with them.

## Conclusion

Overall a really nice session. Thanks a lot to the Société Générale to have
hosted us in that wonderful room, and thanks for their very inspiring talk as
well.

Unfortunately, even if the room had all the video capture capabilities, we
still did not manage to get the videos... It taught us to always record with our
own devices :)


[1]: http://www.societegenerale.com/en/home
[2]: https://www.jetbrains.com/
[3]: https://twitter.com/antoine_peze
[4]: https://twitter.com/adrienblind
[5]: https://twitter.com/Wyam
[6]: http://fr.slideshare.net/OCTOTechnology/tests-on-all-fronts
[7]: https://github.com/Huddle/PhantomCSS
[8]: https://hackerone.com/
[9]: https://twitter.com/tolkicasts
[10]: http://us.battle.net/hearthstone/en/
[11]: https://en.wikipedia.org/wiki/Information_foraging
