---
layout: post
title: "HumanTalks February 2016"
tags: humantalks
---

This month
[HumanTalks][1] was
hosted by [Criteo][2]. We had a hard time managing to
correctly plug the laptops to the projector and connect to the wifi so we
started a bit late. This forced us to cut down the questions from 10mn to only
6 or 7.

![Intro][3]

## Customer Solutions Engineer

First talk was by [Nicolas Baissas][4], my
colleague at [Algolia][5]. He explained what the job of
CSE really means. The job originated mostly in the Silicon Valley for SaaS
companies, but is moving to all sort of companies.

The goal of a CSE is to make the customers successful, by making them happy
to use the product, for the longest amount of time. This is especially important
for SaaS companies where revenue is based on a monthly payment. You do not want
your customers to leave your service, and the best way to keep them is to offer
them a better and better service.

![CSE][6]

There will always be customers leaving, which is what is called a churn, but the
goal of a CSE is to make sure the company has a negative churn. This means that
the customers that stays compensate for those who left, because they now use
more of the service than before. The CSE must ensure that less and less
customers want to leave, by understanding what they are looking for while at
the same time managing to bring more and more value of the product to the
already happy customers.

The only way to do that is to try to be part of their team, being on their side
and not trying to push selling more and more. CSE are experts of their products,
and they share that expertise with the customers. This can happen by email, by
Skype or, when possible, by meeting them directly. This also happens before,
during and after the deployment of Algolia in their system. The CSE ensure that
they use the service at the maximum of what it can offer, and that it is used in
the best way possible to fit their needs.

Month after month, they have a regular look at all the past implementations of
their customers and reach out with advices if they see things that could be
improved. Today Algolia has more than 1000 customers but only 4 CSE, so this has
trouble scaling. So in parallel they also work on making it easy for all the
customers they do not have time to talk to.

They write guides, explaining a specific feature in details, with examples. They
have already explained the same thing hundred of times on calls, so they have
experience on how to explain it clearly, then it's just a matter of writing it
down. They also write detailed tech tutorials. They all have a tech background
and know how to code, so they can really understand what it requires to
implement Algolia in an existing system.

The goal is to automate most of the recurring work. They built a new tab in the
UI that analyze the current configuration of a customer and suggest
improvements. Those are the exact same improvements than they would have
suggested on a one-to-one call, but because they have the experience and know
how to code, they could just simply make it self-service for users directly.

Some of the features are too complex to be correctly grasped just by reading the
theory. This was the case with the geosearch feature. So they created a demo of
it, with real data, using all the best practices and letting users play with it
to see how it was working. This worked really well and transformed a theoretical
feature into a real life application and in turn generated signups to the
service.

What Nicolas really stressed out is that the role of a CSE is to be as close to
the customer as possible, in order to really understand, in a real-life
scenario, what he wants to do, with the very specifics of its project. But as
well be as close as possible to the product itself, part of the team that builds
it so he can exactly know which features are ready and how they work. By doing
both you can really bring your deep expertise of the service to the specific
issues of the customer while helping build the service with real-life examples
of real-life issues customers have.

The ultimate goal of a CSE is to not be needed anymore, the documentation and
self-service information should be enough for most of the users, and core
developers of the service should be in direct contact with the users so they
know how people really use their service.

## JSweet

The second talk was about [JSweet][7], a transpiler of Java to JavaScript.
A transpiler is like a compiler, it transforms a language into another language,
or even the same. There are Java-to-Java transpilers, that can refactor the code
and there are already a lot of tools transpiling to JavaScript
([CoffeeScript][8], [Dart][9] and [TypeScript][10] for example).

![JSweet][11]

Of these threes, it's TypeScript which seems to be the most popular today. It
was originally created by Microsoft, but then Google started using it for
Angular. TypeScript mostly adds a typed layer on top of JavaScript, but still
lets you use vanilla JavaScript wherever you want.

There already were attempts at a Java-to-JavaScript transpiler in the past,
namely with [GWT][12], but it was not as promising as announced and carried many
organic limitations. GWT is too much of a blackbox, and you couldn't use the
generated JavaScript with regular JS APIs, so that it was quickly outdated and
the premise of having all Java in JavaScript wasn't even fulfilled. Mostly, it
was done for developers that did not want to learn JavaScript and just wanted
their backend code to work in the frontend as well.

Later on, we saw the emergence of NodeJS, where one of the cool features was
that you could use the same language on the backend and frontend. NodeJS being
written in JavaScript, it meant that you had to ditch your old Java/Ruby/PHP
backend and put NodeJS instead. JSweet follows the same logic of "same language"
everywhere, but this time it lets you use JavaScript with the Java language. 

TypeScript syntax being really close to Java, it is easy to transpile from one
to the other. Then, TypeScript transpiling to JavaScript, you can transpile all
the way from Java to JavaScript.

This lets you use all your JavaScript libraries (like underscore, moment, etc)
directly in your Java code. And you can also write your frontend code with Java,
letting you follow the paradigm of "one language everywhere". Internally your
Java code will be transpiled to TypeScript, then to JavaScript. Not all of Java
will be available in JSweet, though.

I never coded in Java so I am unsure how useful this really is, but it seemed
like a nice project if you want to keep the same language from back to front.

## Shadow IT

Next talk was about what is called the Shadow IT, by [Lucas
Girardin][13]. The shadow IT encompass all the IT
devices in a company that are invisible to the radar of the official IT
departement. It includes all the employees cell phones that are used to check
personal emails during the day, all the quantified self devices
([FitBit][14], etc), Excel files filled with custom
macros, personal dropbox account and even the external contracts with
freelancers that are not approved by the IT department.

![ShadowIT][15]

Granted, this kind of issues only occur in big companies, where there are way
too many layers between the real needs of employees and the top hierarchy trying
to "rationalize" things. This talk gave a great echo to the first talk about CSE
and reminded me why I quit consulting ;).

Anyway, the talk was still interesting. It started by explaining why those kind
of shadow development appeared in the first place. Mainly it was because the
tools the employees have were not powerful enough to let them do their job in
the best environment. And because employees are getting more and more
tech-savvy, they found their own ways to bypass the restrictions. They expect to
have the same level of features in their day job than what they have back home
or on their cellphone. If their company cannot provide it, they will find other
ways.

Unfortunatly, those ways are frowned upon by the IT departement. Maybe the excel
sheet the employee is creating is really useful, but maybe it is also illegal in
regard to personal information storage. Or it will break as soon as the Excel
version is changed, or be completly lost when the employee leave and no backup
exists.

Then I started getting lost in the talk. Some of the concepts he talked
about were too alien to what I experience everyday that I had trouble
understanding what it was really about. In the end he suggested a way to still
rationalize those various independant parts, buy building a Platform that let
user build their own tools, even if they do not know how to code. This platform
would get its data from a Referential that is accessible company-wide and hold
the only real trustable source of data. And finally, the IT departement will
build Middlewares that will help application A to communication with
application B.

In the end, the IT department will stop building custom applications for their
employees, but simply provide the tools to help them build it themselves. Still,
it will have to create the middlewares to let all those parts discuss.

I cannot help but think that this does not fix the initial issue but simply
gives the IT department the feeling that it is in control again. As soon as the
platform tools will be too limited for employees to really do what they want
(this will happen really quickly), they will revert to using other, more
powerful, tools and this will still be out of the IT departement reach. I fail
to see how this is any different from what it was before, except that instead of
building the application themselves, the IT departement now builds the tools so
the employees can build the applications, but they are still needed to make them
work together and will still be a bottleneck.

You can find the slides [here][16]

## Criteo Hero Team

The last talk was presented by Michel Nguyen and was about the Criteo Hero Team.

Michel told us about his team, the Hero team, for Escalation, Release and Ops.
He added a H in front of it to make it cooler. The team is in charge of
all prod releases as well as dealing with incidents.

![Hero team](/img/2016-02-09/hero.jpg)

They realized that whenever they put something in production, something else
breaks. So they started coordinating the releases and having all the people that
could understand the infra in the same team, to better understand where this
could break.

The now use a 24/7 "follow the sun" schedule where teams in France and the
US are always awake to follow the potential issues. They have an escalation
system with two layers, that let them deal with the minor issues without
creating a bottleneck for the major ones. The Hero team is in charge of finding
the root causes of the issues and if no root cause can be found quickly enough,
they will just find a temporary workaround and dig deeper later. Once the issue
is found and fixed, the do a postmortem to share with everybody what went wrong,
how they fixed it, and ways to prevent it from happening again.

They use [Centreon][17] and [Nagios][18] as part of their monitoring and check
after each production release the state of the metrics they are following, to
see if nothing extremely abnormal appeared. If too many metrics changed too
widely, then we can assume something is not working correctly.

The current production environment of Criteo is about 15.000 serveurs, which
weight as much as 6 airbus and is twice the height of the Empire State Building.
They handle about ~1200 incidents per year and resolve about 90% of them in
escalation. The last 10% are incidents that depends from third-parties, or
one-shot incidents that they never understood.

To be honest, even if the talk was interesting (and Michel is a very good
speaker), it felt too much like a vanity metrics contest. I know Michel had to
cut his talk from 30mn to 10mn in order to fit in the HumanTalk format, so I'd
like to see the full version of it.

## Conclusion

I did not felt like I was the target of the talks this time. I already know
everything about the CSE job because I work with them everyday, I never coded in
Java, stopped working in companies big enough to have a Shadow IT issue and as
I said, the last one left me hungry for more.

Still, nice talks and nice chats afterward. Except for the small hiccup with the
projector and wifi at the start, the room was perfect and very comfortable and
the pizza + sushi buffet was great.

Next month we'll be at [Viadeo][19]. Hope to see you there!


[1]: http://www.meetup.com/fr-FR/HumanTalks-Paris/events/228454758/
[2]: http://labs.criteo.com/
[3]: /img/2016-02-09/intro.jpg
[4]: https://twitter.com/nicolasbaissas
[5]: https://www.algolia.com/
[6]: /img/2016-02-09/cse.jpg
[7]: http://www.jsweet.org/
[8]: http://coffeescript.org/
[9]: https://www.dartlang.org/
[10]: http://www.typescriptlang.org/
[11]: /img/2016-02-09/jsweet.jpg
[12]: http://www.gwtproject.org/
[13]: https://twitter.com/PykPyky
[14]: https://www.fitbit.com/fr
[15]: /img/2016-02-09/shadowit.jpg
[16]: http://fr.slideshare.net/LucasGirardin/human-talk-shadow-it-invitable-ou-pas-par-lucas-girardin-pykpyky
[17]: https://www.centreon.com/en/
[18]: https://www.nagios.org/
[19]: http://fr.viadeo.com/en/
