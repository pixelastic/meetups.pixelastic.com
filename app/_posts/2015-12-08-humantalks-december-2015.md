---
layout: post
title: "HumanTalks December 2015"
tags: humantalks
---

_Note: These notes are from [Adrien][1]. Thank you very much Adrien!_

For December, HumanTalks were at *LeBonCoin*.  After several days of conferences
with the *dotJs*, *dotCss* and *apiDays* Tim needed some typing *REST* and
delegated it to [me][2]

## Polyfill and Transpilers, one code for every browser

First talk by Alexandre Barbier ([@alexbrbr][3], explain the why and how of
progressive enhancement in js.

One of main task of web developers is to ensure compatibility across browsers.
And if things are getting easier (*less painfull*) with the death (*end of life
support*) of severals IE, _web is still the most hostile environment_.

Once target browser has been defined, there are two different ways to do it.

Using **polyfills**, which consist in reimplementing some API in pure js if this
one is not defined. First you need to detect if the feature is available, if not
you need to implement it.

If you want to use the last features of js, the one that has not been
implemented (such as *EcmaScript 6/2015*), you need to use a **transpiler**
(source to source compiler). More than 270 language target *js*, from
*coffeescript* to *clojurescript* along with *dart* and *typescript*. One of the
most used is [Babel][4] which just hit its 6th version

## Transhumanism, the singularity advent

After Transpilers, Transhumanism by Pierre Cointe
([@pierre_cointe][5].

The talk presented history of transhumanism, that came from eugenics as a way to
evolve willingly the human specie.  *NBIC* Technologies (Nano tech, Biotech,
*Information technology*, Cognitive science)

Pierre presented some of the projects associated with it such as immortality,
genome manipulation, consciousness transfer. Then he presented some of Raymond
Kurzweil predict, which based on an extended Moore law to predict the singularity
around 2030, the *singularity* being the point in time where a super computer
would be more powerful than an human brain.

## Develop application for the TV

The next talk was done by Mickaël GREGORI ([@meekah3ll][6]), and present us his
experience developing application for the television.

Not that a friendly place neither, with no standards, SDK, xmls...  After
presenting the market he focused on three products: ChromeCast from Google,
Roku, and Android TV.  Most of the application consist in creating a new dynamic
channel TC.

To conclude he talked a bit about a standard that may be on its way, W3C being
working on a *TV API*

## How to be more productive with three methods

The fourth and last talk was made by Thibault Vigouroux ([@teaBough][7])

He presented 3 ways he is using everyday to be more effective at what he is
doing.

The first one was the *Pomodoro* which consist in working 25 minutes on the
task, being focused, then taking a 5 minutes break to rest and letting the brain
work in diffuse mode.  He told us about Pomodoro Challenge, an application
flexible that rely in gamification to get you used to practice.

Then he present a way to help choose a task, the Eisenhower Matrix. For it you
need to label your task according to two criteria: importance, emergency.

Basically you do know what's both important and urgent, you delegate the urgent
non important, and decide when to do what is important but not urgent. (note
how I deleted the section about non important non urgent stuff)

To finish he talked about how to be better at a task with deliberate practice,
which he used to switch to *colemak layout*.  5 components are vital for this:

1. Being focused on improving the result
2. Immediate Feedback
3. Easily repeatable exercises
4. Not really pleasant
5. Mentally Intense

## Conclusion

Very diverse and interesting talks as usual. :)
Good meet up to conclude the year!


[1]: https://github.com/pixelastic/meetups.pixelastic.com/pull/3
[2]: http://twitter.com/adrienbecchis
[3]: https://twitter.com/alexbrbr
[4]: https://babeljs.io/
[5]: https://twitter.com/pierre_cointe
[6]: https://twitter.com/meekah3ll
[7]: https://github.com/TeaBough
