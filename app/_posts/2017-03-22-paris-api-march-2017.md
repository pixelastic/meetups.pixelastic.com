---
layout: post
title: "Paris API March 2017"
tags: paris-api
---

Yesterday I was at the [Paris API meetup][1] at "La Maison du CrowdSourcing",
where the [KissKissBankBank][2] office is located. The Paris API meetup is
organized by [Mailjet][3], and [Grégory Betton][4], one of their developer
advocates was the host.

The meetup historically had two talks per session, to keep the sessions short
enough so people can still get back to their families without sacrificing on the
networking time.

This time though, the sessions were exceptionnaly short has both speakers
finished their talks earlier than anticipated. Content was still interesting,
and we had plenty of time to discuss afterwards, so that's not a bad thing.

## API First to the rescue of my startup

The first talk was by [Alexandre Estela][5], from [Actility][6]. Where he
explained how to conceive APIs and how to avoid the common pitfalls. His point
was that, when working in a startup, we are often time-constrained. We have
tasks to do, urgently, and not enough people to do it. So when comes the time to
build an API, we tend to rush it and we end up with something that is half
broken, hard to maintain and not usable. We also tend to rush into the
development phase to have something in production and do not spend too much time
thinking about the design.

He gave a list of tools that helps you focus on the design of your API, its
specifications, and that will build all the plumbing around it for you. All his
talk was focused around [Swagger][7] and the tools of its ecosystem. Following
his approach, you always start with the specs of your API, spending your time
thinking about the design.

Then, you use [swagger-inflector][8] on top of it. It will parse your specs and
build all the plumbing and create the required endpoints for you. You need
to follow some specification and the tool will take care of the rest. It will
even create the mocks letting you test your API right away.

No code is finished until it is documented, you also run
[swagger-codegen-slate][9] to generate the documentation, following the popular
[Slate][10] framework (used by [Stripe][11], to expose how your API is
supposed to work.

[swagger-codegen-bbt][12] will let you do black box testing. It will re-use the
examples you defined in your specs and will test changes to it to
generate real-life test scenarios.

And to finish, the most well-known is [swagger-ui][13], that will generate
a full HTML playground, exposing your endpoints and letting people play with it.
Having interactive demos for APIs is for me the most important part to discover
what an API is doing. When confronted with a new API, most users will read the
short description then they will try to play with an example and after that will
they read your documentation. So having a live playground for them to do
requests is key for the adoption of your API.

His approach was sound: you start with the specs, and then you let the
tooling generate the rest around. The backend code will most of the time
be generated in Java because that's where Swagger is coming from but I think you
can also make it generate it in node or go (although I'm not sure all the
plugins will be compatible).

In the end, it will save a lot of time in the long run, but you'll have
a starting cost of bootstrapping all the tooling that might not be worth it if
you plan to do one and one quick and dirty API. Having everything
automated and being able to build tests, mocks, documentation and demos
is invaluable, but you still need to spend time writing the specs and examples
for everything else to work.

Short talk, but to the point.

## PhantomBuster

The second talk was about [PhantomBuster][14], by Antoine Gunzburger.
PhantomBuster is a crawling API on top of [PhantomJS][15]. Its purpose is
similar to what [Kimono Labs][16] offered. Not all websites have an API, and
when you want, as a developer, to get content from them, you have to resort to
crawling them.

Kimono Labs offered a GUI where you had to click on elements of the page
you were interested in, and they created an API endpoint that used to expose the
data you selected in JSON format. It was a way to make any website into a JSON
API for easy consumption.

I'm talking into the past as Kimono Labs shut down end of February.

PhantomBuster is doing something similar except that instead of providing a GUI
for you to click on the elements you need, it lets you write custom javascript
code to crawl websites and extract content. It is packaged with many features
already (like screenshots or captcha solving), but still requires you to write
some code.

In the end I'm not sure I will use the project as I already have crawling
scripts ready and using them often, but I see how this can be useful into
prototyping and API for a POC.

## Conclusion

It was my first time at the Paris API meetup. I will surely suggest a talk for
the next session, I liked the mood of the meetup. Thanks to both speakers for
the interesting content.


[1]: https://www.meetup.com/fr-FR/ParisAPI/events/238083724/
[2]: https://www.kisskissbankbank.com/en
[3]: https://www.mailjet.com/
[4]: https://twitter.com/grebett
[5]: https://twitter.com/alx_estela?lang=en
[6]: https://www.actility.com/
[7]: http://swagger.io/
[8]: https://github.com/swagger-api/swagger-inflector
[9]: https://github.com/regga-ws/swagger-codegen-slate
[10]: https://github.com/lord/slate
[11]: https://stripe.com/fr)
[12]: https://github.com/regga-ws/swagger-codegen-bbt
[13]: http://swagger.io/swagger-ui/
[14]: https://phantombuster.com/
[15]: http://phantomjs.org/
[16]: https://www.kimonolabs.com/
