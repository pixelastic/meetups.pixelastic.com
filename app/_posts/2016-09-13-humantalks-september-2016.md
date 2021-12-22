--- 
layout: post 
title: "HumanTalks September 2016" 
tags: humantalks
---

For the [September session][1] of the HumanTalks, [Sfeir][2] accepted to host
us.  Everybody was coming back from vacations (including us, organizers) but we
managed to find 4 speakers and a place to host in a short amount of time. Tasty
bagels and a nice terrace under the warm sky of September is a perfect way to
start a new year.

## FedEx days

First talk was about an experiment done at [NanoCloud][3], something they call
FedEx days. They did not invent the principle, and you should be able to find
[articles on the subject online][4].

The goal of FedEx days is to bring coworkers together in a timeboxed
session to work on a specific subject of their choosing. They marked a day in
their calendar, and one week before they asked everbody to suggest ideas of
projects that could be built. Projects need to bring some value to the company,
and need to be something you can actually build (no wild dreams here). Then
everybody pick a suggest and form a team of about 4 people to work on it. Having
no more 4 people in a team creates a climate of healthy competition.

In their iteration, most of the people chose a group based on their personal
affinities with others, so there was no diversity in the teams. It's
something they would like to change for the next event.

But what was nice was to bring together in the same team people that have been
in the company for a long time as well as recent hires. It helped the new hires
to better know their coworkers and the product. They plan to make it an
"official" part of the hiring process for the next hires.

I'm personnaly unsure this is something I'd like to do on a regular basis. Or,
let me reformulate. I think small team of friendly coworkers working on small
features that bring value to the company should be what every day should look
like. But actually immerse new hires in a team when they join, so they can know
their coworkers better, have a deeper understanding of the product and bring
something to the company seems a good idea.

## ES Next Coverage

Second talk was way more technical, about a code coverage tool. [Oleg][5], from
Sfeir, is the developer of [esnext-coverage][6]. We saw how testing code is
important, but also how having coverage of the tested code is an indicator of
test quality.

Not everybody does testing, and even less people do coverage. Configuring the
whole test/coverage stack is time-consuming and often discouraging. Oleg
tried to make it as simple as possible with esnext-coverage so developers
couldn't hide behind excuses.

The tool allow the exporting of the results in `json` or `HTML` as well as any
custom formatter. This is an improvement over [Istanbul][7] that apparently have
a limited list of built-in formatters. The default HTML formatter creates
a single page application that you can use to browse through the code.

We then saw how all this works in practice, including a live-code of the
instrumentation phase, where the initial code is transformed into another code
that will "count" each time a line is executed. The whole demo was done in [AST
explorer][8], an online AST (Abstract Syntax Tree) console.

Basically every call to a method, or every variable assignment is replaced
with a call to a method that will increment the count associated with the
current line.

Interesting talk, I always like to see people write code that write codes.
I like the meta aspect of it. Also, Oleg is a great speaker which made
understanding the underlying concepts easier.

## Taking the hard out of Hardware

[Alex Bucknall][9] from [Sigfox][10] tried to show us how
hardware isn't actually so hard, and why it's actually closer to software than
we could think.

It looks complicated because we cannot see it. But so is software, and concepts
between hardware and OOP are often the same. Classes, Objects, Inheritance, all
of that can be found in hardware as well.

Alex explained how the basics of hardware are actually simple, and how
more complicated pieces are built out of simpler blocks and then packaged
under a new name. And even more complex blocks are built out of those previous
ones, and so on.

Everything looked so easy when Alex explained it, but still it felt too fuzzy
to me. There are still concepts and words I don't get (frequency,
voltage, etc) that I had trouble following.

If anything, it nicely introduced what SigFox is doing, namely
hardware blocks that can communicate between each other through familiar
HTTP/API/callbacks mechanisms.

## What is a stand-up meeting?

Last talk of the day was about the stand-up meeting ritual, dear to the Agile
methodologies, presented by [Thibaut Cheymol][11].

Stand-up meetings must answer three specific questions: What did I do yesterday?
What will I do today? What issues did I face? All three questions must be
answered without forgetting the current sprint goal.

If done like it should, the stand-up meeting will boost the motivation of the
team, letting everyone having a clear picture of what they are going to do
today, and more importantly: __why__.

But we all know that the stand-up meeting can turn into a reporting game
where everybody waits for their turn to speak and report in a military
fashion what they did the day before.

The advice given by Thibaut against that were to:

- Actually stand up. No chairs, no leaning against the wall, no computer.
- 15mn tops. More than that and it's boring
- Start on time. Be concise. No discussion, no interruption.
- Be prepared (~5mn the day before)

Other more generic advices were to always talk about what was __done__, not what
is in progress. Trying to talk about the end goal ("_I made sure that people
could buy the product_"), instead of the actions done to achieve it ("_I
implemented the API responses_").

Not everything goes as planned, we often have issues that need to be
dealt with in the moment, delaying us from what we planned on doing today. In
that case, we need to fix issues when they arise, but talk about them on the
next stand-up meeting. To avoid having discussions and/or people talking
for too long, Thibaut suggested the following three-turns approach:

- Everybody, in turn, tell what the issues were
- Everybody, in turn, tell what actions they did to fix the issues
- Everybody, in turn, expose the results of the actions taken the day before

I haven't been doing a single stand-up meeting in the past year and a half, and
I don't miss it at all. I did a lot of them in my previous job, but never
perceived it as valuable tool (because we fell into the classical traps, maybe).
I'll keep those advice in mind if I ever have to do another stand-up meeting
again.

## Conclusion

Thanks again to Sfeir and all the speakers. Next month we'll be at Prestashop,
with 4 new talks. Hope to see you there.

[1]: https://www.meetup.com/fr-FR/HumanTalks-Paris/events/233912259/
[2]: https://www.sfeir.com/
[3]: https://www.nanocloud.com/
[4]: https://www.scrum.org/Portals/0/Documents/Community%20Work/Scrum.org-Whitepaper_FedEx%20Day%20-%20Lighting%20Corporate%20Passion.pdf
[5]: https://twitter.com/olegskl
[6]: https://github.com/esnext-coverage/esnext-coverage
[7]: https://github.com/gotwarlost/istanbul
[8]: https://astexplorer.net/
[9]: https://twitter.com/AlexRBucknall
[10]: https://www.sigfox.com/
[11]: https://twitter.com/thibaut_cheymol
