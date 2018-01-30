---
layout: post
title: "HumanTalks January 2018"
tags: humantalks
---

To kick start the new year, last Tuesday was the [first session][1] of the
[HumanTalks Paris][2] meetup. I am one of the organizers of this meetup, but
this time I sat in the audience, took notes, and decided to share them with you.

HumanTalks meetups are taking place every second Tuesday of each month. They
always feature 4 talks of 10 minutes, followed by 10 minutes of questions. Most
of the talks revolve around what could be of interest to developers, or to
people that work with developers in a broader sense. Last night we had an
introduction to React Native followed by another talk showcasing a real-world
implementation, an explanation of atomic design principles and we finished with
a high-level overview of microservices.

Evert month, a different company hosts the meetup. This time it was
[Onepoint][3], and the place was gorgeous. If you were not there, here is what
you missed:

## 5 pre-conceived ideas about React Native

[Nicolas][4] is a mobile engineer at [BAM][5]. When they started, they were
using [Cordova][6] to build mobile apps. Cordova embed a webview inside a native
app, allowing you to code in HTML/JavaScript/CSS just like on the web. It kinda
works, but does not feel native.

They then moved to [React Native][7], and he demystified what React Native is
really about. It's based on React but instead of having components rendered as
HTML, they are rendered as native elements. Basically, instead of using HTML
tags like `<a>` or `<div>`, you would use `<View>` or `<Text>`.

Because it's not *really* native, you could think it will be less performant and
smooth. That's not even true. As the end result will always be native
components, you have no performance issue there. Where you can have bottlenecks
is mostly in the React part, just like any other React application, but is not
tied to the native implementation. Large companies like AirBnB or Wallmart are
doing their mobile apps using React Native today.

Being based on a JavaScript framework, you could think that it will die in
2 months when a new shiny framework will get released. Well, it's impossible to
know for sure but there are currently 27 active committers on the project and it
is officially backed by Facebook, so those are good signs that it's here to stay
for a while.

But is it mature enough today? Well, there is a new version released every
month, with breaking changes. They add support for new devices regularly, so it
means it has an extended compatibility. The downside is that upgrading to a new
version every month is painful. It should get better, with less frequent
releases and breaking changes, but today the road is still a bit bumpy.

But the very good sign is that it uses the exact same ecosystem than React, so
every library that works with React will also work with React Native. In
addition to the already large list of available modules for React, the React
Native community is also quite active and you can find ready-to-use modules for
many interaction patterns already. Also, because it is a layer on top of native
components, it means you can still use native components directly, so it's easy
to integrate your own external SDKs.

If you've read this far, maybe you're now convinced that React Native is a tech
worth trying. Best ressources to get started are [egghead][8] and the [official
tutorial][9].  The basic tooling also come with a live reload that works with
the native Android/iPhone emulators.

Recruiting React Native developers today is not easy though. The tech is quite
recent, so it's easier to hire React developers and train them to learn React
Native. The jump can be done in ~3 weeks. You can also train an experienced
JavaScript developer to React Native directly.

I liked this talk because it was clear and to the point. I didn't know much
about React Native before, and I feel I now have a better understanding of how
it works, what it does and what it doesn't. Special kudos to Nicolas that
prepared this talk in one week time!

## E-learning without Internet

The second talk was a perfect segway as [Richard][10] talked about an
application he wrote in React Native.

The application is called [Chalkboard Education][11], and is a way to give
offline access to university courses to students in Ghana. There is not enough
room in the universities of Ghana, so only 1 out of 4 student can get a seat.
Almost 50% of students have a smartphone though, but internet connection is
unstable and expensive.

The goal of the application is to give students access to the courses directly
on their phone, even with no connection. The app uses a [Symfony][12] backend to store
all the actual content (and where administrators can add new courses), and the
front-end is a PWA done in React Native.

[PWA][13] is not a new language, it's a set of best practices to have mobile web
applications behaving like native applications. One of those features for
example would be to be able to add an icon on the homepage to directly open the
website/app.

A majority of the students are using an Android phone, which is fortunate
because most of the PWA features are actually available on Android. Going for
a PWA also allowed the developers to quickly ship new version, not having to
deal with the hassle of submitting an app to a proprietary store.

Even if the Symfony backend exposes an API, the app does not follow
a traditional API-centric approach, where each page has to request the API to
get its data. Remember that connectivity is unstable and expensive, so they'll
want to limit calls and have the best offline experience.

The first time you open the app, it will ask the API for the list of all courses
available. At that point it will download all the metadata (the name of the
courses), but not its actual content. The user will be able to
navigate through the list of all available content, having a first glimpse of
what will be available.

In the background, the application will download all the text and images,
displaying a small progress bar. It does not block the user, they can still
browse and access the content as it gets downloaded. Once finished, the user can
turn off the connectivity and have access to everything.

Text are stored in `localStorage` and extracted when needed. Image requests are
intercepted by service workers and returned from cache instead of hitting the
network.

They even managed to handle the student progression through SMS. Whenever
students finished a course, they could validate it by sending an obfuscated code
to a specific number, and they would get another code in return that they could
enter to unlock the next part. All the content is actually already downloaded in
the app, but is unlocked when the correct code is entered.

This was a nice and clever use-case for an offline app, using tech to bring
knowledge to people!

## Atomic Design

The following talk was another talk by a BAM employee. Thanks to them for
filling the missing speaker slot so quickly! This time it was France, a mobile
app designer that gave us an introduction to atomic design.

The classical workflow for designing apps is to first think about the user
journey, then map each step of the journey through wireframes, transform those
wireframes into mockups and then hand it to the devs to integrate.

It works well, but it forces everyone to think in terms of pages. Each step is
a page, and each page has to have its specific mockup. It creates a lot of
duplication because for a simple login form, you have to create a mockup for the
login, another for the signup, and handle when the inputs are empty, when there
is an error, etc. Just like duplicating code will lead to more errors,
duplicating mockups will also lead to inconsistencies.

The problem is even more visible when various states of an element have to be
created. In a long form for example, including checkboxes, tooltips, error
messages, notifications, etc. you can either create a new mockup for each state,
or create a meta-mockup with all states at the same time. The first one is time
sink, and the second does not represent reality.

Also, by forcing yourself to think in terms of pages, you lose some cohesiveness
in your app. You can make very nice looking pages, sure, but the last you
created will be very different than the first one. It will become a frankenstein
monster of different styles at the end and your users will feel confused.
Repetition of common patterns will create a sense of familiarity to your users,
and once you have familiarity, you build trust. If each page of your app is
different, you'll lose credibility.

So, what is atomic design and how does this solve this issue? The metaphor comes
from the atoms, being the smallest non-breaking element you can have. You can't
go smaller than that. In design those atoms are things like font name, margin
size, colors.

Those atoms you group into molecules: input fields, buttons, links. And those
molecules, you group into components: login prompt, comment display,
notification bubble. Once you have those components, you can mix them to create
your pages.

This list of atoms/molecules/components are gathered into a styleguide document,
shared with the team, and that they can use to build pages. It will help the
designers' life, because they will have a source of truth, a list of words they
can use in their visual sentences to build pages. But it will also help
developers, when confronted to a page that was not planned by the designer,
they'll be able to pick one of the existing components (or build their own using
the existing molecules).

The approach seems to make a lot of sense, and France was able to explain it
clearly on stage during her presentation as well as during the Q&A session.
I still have a few questions about that though: like who is responsible for
keeping the styleguide up to date, and what form should the styleguide have
(should it be an online document or should it take the form of a CSS framework
for example?).

## Microservices architectures

The last talk was more high level, talking about microservices architectures.
I've seen a lot of talks about microservices in the past, and a lot of them were
filled with buzzshit (a mix of buzzword and bullshit). This one was very
different. I learned a lot.

Microservices archictures were first conceptualized in 2014 by [Martin
Fowler][14].  Every 5 years on software development, we have someone explaining
how everything we did in the past 5 years was dumb, and what the new way should
be.  Microservices new way is to get away from the monolith app and have several
small services, each focused on doing one thing.

Microservice should be deployable independently and automatically. Having small
services also makes scaling easier. You no longer need to replicate your full
monolith app several times when what you only need is scaling a specific part of
it. It will also help you deploy new features in small increments.

The language used for each microservice should have no importance, just use the
right tool for the job, and don't bother about having a uniform stack. Having
different languages will mean you'll be able to add new components
when the need arise, and use the best tech to do it. It makes recruiting people
to work on them way easier than having to recruit for an old tech.

The hardest part of microservices is finding the right size. You want to avoid
both nano services (that only hold one method), as well as macro services (that
are more akin to god objects doing everything). You have to split them by
business logic, and you'll have to think carefully about that. You should
definitely not split by language.

Microservices will communicate through APIs (REST most of the time, but it's not
a hard ruling). APIs are code interface, but you will also need a lot of human
interface. Each team will work on a specific microservice and they'll have to
work together to make it work. Following [Conway's law][15], your microservices
architecture can only be as good as your inter-team communication.

But one essential point of microservices is that you should start using them
only if you have some requirements in place already. Because you'll now have
much more services to deploy, you *need* to have a way to ship quickly and in
a reliable way. You need automated monitoring, testing, and deployment before
you even start splitting your monolith.

Having so many moving pieces will also force you to think about errors in
a different way. Errors will no longer only happen inside a service, but also in
the way they communicate. Each call can potentially fail, requiring you to have
an overview of all the calls and handle the failovers. Tools with a [Chaos
Monkey][16] approach can help you have a better understanding of what can go
wrong.

The talk was packed with content. Mahdi only managed to cover 1/3 of all the
slides he had prepared for the talk, and doing so at fast pace already. It might
not have been the best introduction to microservices if you never heard about
them before, but if you did, there were a few nice nuggets of information
inside.

## Next month

Next month we'll be hosted by BlaBlaCar. Hope to see you there!


[1]: https://www.meetup.com/fr-FR/HumanTalks-Paris/events/246478316/
[2]: https://www.meetup.com/fr-FR/HumanTalks-Paris
[3]: https://www.groupeonepoint.com/
[4]: https://twitter.com/nhacsam_
[5]: http://bam-mobile.com/
[6]: https://cordova.apache.org/
[7]: https://facebook.github.io/react-native/
[8]: https://egghead.io/browse/frameworks/react-native
[9]: https://facebook.github.io/react-native/docs/tutorial.html
[10]: https://twitter.com/richardhanna
[11]: https://www.chalkboard.education/
[12]: https://symfony.com/
[13]: https://developers.google.com/web/progressive-web-apps/
[14]: https://martinfowler.com/articles/microservices.html
[15]: https://en.wikipedia.org/wiki/Conway%27s_law
[16]: https://github.com/Netflix/chaosmonkey
