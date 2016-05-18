---
layout: post
title: "HumanTalks July 2015"
tags: humantalks
---

_Note: For this post, I'll try to write in English. I'm now working in an
english-speaking company and I'm already writing emails in English to give
feedback on the HumanTalks sessions. I'm not used to write such lengthy posts in
English, though. Hopefully I'll get better at it the more I do it._

This session occurred at [Prestashop][1] new office. Right near the Gare
St-Lazare in Paris, the office was brand new and really nice. For those that
don't know, Prestashop is the "Wordpress of e-commerce". They did a quick
recruiting speech at the start of the meetup, and they are looking for devops
and front-end devs.

# OpenID Connect

{% youtube https://www.youtube.com/watch?v=moNZ1jrazsc %}

The first talk was from my former coworker and mentor, [François Petitit][2]
from [Octo][3]. He talked about the [France Connect][4] initiative, pushed by
the French government to have some kind of state platform where all
administrations could exchange data in a uniformed way.

This ultimate goal is, as a citizen, that you do not have to fill the same form
asking for your name, address and social security number every time you apply to
a state service. Also, this will remove the burden of having to provide all the
necessary papers to an administration. With the France Connect initiative, your
profile will be centralized and shared between all the state instances and they
could securely get documents from one another.

François worked on the main bricks of implementation and on one of the first
real-life implementations. France Connect wraps several identity providers and
identity clients. Each brick can be either provider or client.

This mean that one brick could act as a provider of identity, responding to
requests of other bricks with data about a citizen. It could also act as
a client, asking data about a citizen to other bricks of the network.

The application on which François worked was both, so he had to implement both
sides. The protocol used behind the scenes is [OpenId Connect][5] which is
already used by Google, Microsoft or Paypal. This must not be confused with
OpenId.

OpenId was the ancestor, but it has now be deprecated and OpenId Connect is the
new standard, which is based on OAuth 2. The OpenId group is an official group
that can certify libraries and implementations of the protocol.

The OpenId Connect norm was finalized in 2014, with already some implementations
in production. When you sign-in with Google on any site, this is using OpenId
Connect. The spec defines ways to normalize the way sessions across several
sites are handled, as well as how multi-identities on one site should be
treated.

François told us about the real-life scenario they were implementing. Let's
imagine you want to apply for a scholarship from you city website. Here, we are
dealing with three actors. You, as the main user. The city, through its website.
And an identity provider (to tell the city who you are).

You start by navigating to your city website. It asks for identification. You
can choose which site can give your identification from a list (it could be the
social security, or the tax department). You're then redirected to the website
you choose. You login there and you're automatically redirected back to the
initial website (the city one), with all your information already filled in. The
needed data was send by the social security/tax department you logged to.

OpenId connect defines a set of standard to define a person, what fields should
be used. This makes exchange between different providers easier.

The current landscape of OpenId is full of libraries, used by big names and most
of them are officially certified. You need about 3 days of work to be able to
consume information from a provider. To become yourself a provider this can take
a bit longer. From their experience, what took the most time was not the
implementation it self, but being able to get access to the data in the first
place.

Nevertheless, it is important to note that the OpenId specs are very large and
some areas are not clear or you can do the same thing in very different ways.
This results in various client/provider implementation handling thing so
differently that they are not really compatible in the end.

## Make your business SPOF-less

{% youtube https://www.youtube.com/watch?v=IYE9ih9EGJk %}

The second talk was from [Alex Centar][6], one of the founders of [Jumboweb][7],
a French web agency of 4 people. They mostly do web and mobile custom
applications. Their company is growing, which makes them have less and less
time. They decided to start working remotely and gave us some feedback on how to
make it go smoothly, even when something goes wrong.

They realized that they had a lot of [SPOF][8]s in the way they did things. When
you start looking for SPOFs, you find a lot of them. The A/C can be a SPOF
during summer. Internet access and electricity certainly are. And each of the
4 members of the company are SPOFs also if they disappear.

They started to count how many projects would fail if one team member had an
accident? 1, 2, 10? And would it put the whole company down? They had to find
a way to limit that.

First of all, they added fallbacks to the tools they often use. Having a fixed
telephone line in case the mobile one stops working. Backup all their work from
their laptop machines to a decentralized server automatically, in another
location.

Then, they put all the passwords in a [Keepass][9] file, shared in their
[Dropbox][10]. They gave access to the Calendar and Financial information to
everybody. Any tool one of them was using was also opened so anyone could use
it, even if they did not need it at the time. This includes TODO lists, bug
trackers, Evernote, Slack. The goal was that everybody had access to the same
information.

Then, they started sharing their work. They wanted to do more than simply
working together, they wanted to be able to have each of them able to work on
all projects easily.

They do systematic peer programming, so that the code of one project is not in
only one person head, but at least in two. They do code review on everything, at
first with only the two developers involved, then with all the team. That way,
everybody works on every projects, and when a critical bugfix is required,
people at least know where to start. But still, they keep only one privileged
interlocutor for each project when speaking with their customers. They kept that
because it is better for the customer to always have the same person they are
talking to.

They found that this was providing the best quality of their work. Everyone is
able to work from anywhere, everybody learns, seniors can teach juniors and no
project is ever stalled.

But our jobs requires that we do a lot of technology watch to keep us afloat in
this ever-changing world of web development. So, to be sure that all of them had
enough time to read and learn while keeping the company running they created
a kind of reward system.

Each worked day earn employees "free time" that can be used for technology watch
without pressure. They did the math and know the minimum number of worked
hours that will keep their company running. Anyone has a counter of free time
available and you're encouraged to use it. I must admit I did not completely
understood the algorithm used here, but they did an open-source webapp to keep
track of all the time spend on work and gained (they use the Freckle API to keep
track of time).

They decided that the goal of their company was the well-being of the 4 of them.
More time for family, more time for personal stuff, while still earning enough
money to live with enough comfort. They get payed by the hour, they know what
the budget for a project is, so they can easily know when they're making
a profit and when they're not.

## Mobile development recap

{% youtube https://www.youtube.com/watch?v=wsAMdKKHjck %}

The next talk was the story of [David Wursteisen][11] that wanted to create
a native app.  He followed the advice from John Carmak (the creator of DOOM),
who said that it is easier to launch application on small platforms, because you
have less options and less things to consider.

So David started creating it own game on an Android device, but he soon
discovered than creating a game is much more difficult than he initially
thought. You need to be good on a large set of skills.

So he started working on a simple app instead. He wanted an app that
automatically set its phone to vibration mode when he was at work, maximum
volume when at home, and silence mode at any other moment.

He first downloaded an existing app that did the same thing, to see if the idea
was actually useful. The test was positive, but the app he tested had much more
features than he really needed. So he started working on its own app, with only
one feature, but one he needed.

Before coding anything, he started testing the UI with slides. He showed it to
several people, but nobody could understand how it worked. He tried with icons
instead of text labels, people reacted better. Then he did a quick paper
mockup and tested it on a few friends. He managed to simplify the UI still a bit
more.

So he started coding. At first he followed the Google tutorials and guidelines,
but he found them to be overwhelmingly complex and finally used tools he already
knew : IntelliJ and Java. He lost a bit of time understanding how to register
its app on the Play Store, but finally it was released.

He then discovered than debugging an app in the wild is hard. When the app
crashes on one of your user's phone, you have no way to access the stacktrace to
debug (unless the user clicks on "Send the crash report". But nobody does that).
He had to release a new version that included a crash reporter built-in.

The app was working quite well, he now had to find a price to sell it. He chose
0.79€. Now, it was time to make discovering of the app in the Play Store easier.
At first it was quite hard to find the app (it is named Georing, but the Play
Store suggested Goering instead. Not very helpful). He tried the good old method
of contacting (online) newspaper to talk about its app, but none never replied.

He increased the price. 0.79€ seemed to cheap, so he thought that by increasing
it, it would show that the app was of good quality. It actually did not change
anything on its number of download. He finally decided to put it completely free
(and here an important note, it is not possible to revert this choice. Once an
app is set as free, there is no way to set a price for it later, so be careful
when making that choice).

This change actually paid off (no pun intended), as he got 15 new downloads! He
then tried to make it more known by using Twitter, talking about it in meetups,
to his friends and family. He considered adding ads inside the app at one point,
but finally decided not to.

In the end, I really liked this talk because it shown the whole journey of
someone who never created a native app to one that is available on the store. He
did not spend too much time on the technical side but much more on all the
questions you have to ask yourself when doing this kind of thing.

This was a very honest explanation, and I liked the posture he chose regarding
price, ads, iterations and the MVP process.

# Tails

{% youtube https://www.youtube.com/watch?v=HLta6dfaMS0 %}

Last talk was by Jean Baylon, and about the [Tails][12]
Linux distribution.

The goal of the distribution is to be anonymous when going on the Internet. It
lets journalists pass through the multiple layers of censorship. It actually is
part of the base tech package of [Reporters Without Borders][13] and was also
approved by Snowden.

Their are currently about 11k users (and one can wonder how we can get this
number if the goal is actually to stay anonymous, maybe number of downloads?)
and there are about 20 developers committing on the project on a regular basis.
It got part of its funding from other projects in the field, like [TOR][14],
[Debian][15] or the [Freedom of Press Foundation][16].

Tails should be used when you are doing something out of the ordinary. And it is
not enough to protection your anonymity. If you use Tails to buy something on
Amazon with your credit card and have it delivered at your place, it won't help.

What it does is having TOR and Firefox installed and configured by default. It
also has an encrypted [pidgin][17] and automatically spoof the MAC address. It
is loaded with `aircrack ng` to check the current wifi security and reliability
and also contains a bitcoin wallet.

You can run it from a USB key, without installing anything, with absolutely
everything loaded in memory. It means that it won't even leave a file on the
file system. Its UI can mimic common windows UI in case you have to load it from
a public cyberspace. You can even use a virtual keyboard that would bypass any
hardware key logger that might be present in the keyboard.

Nice and interesting project, whose internal tools are now more and more common
practice in the more popular distributions.

I'll just finish on a small note. The simple fact that you searched for it on
Google would put you on some kind of list somewhere in the NSA files. And coming
to a meetup that talked about it as well. And maybe just even reading this blog
post.

## Conclusion

Nice and varied talks as usual, honest feedback about projects people actually
did. That's why I like the HumanTalks so much.


[1]: https://www.prestashop.com/en/
[2]: https://twitter.com/francoispetitit
[3]: http://www.octo.com/en
[4]: https://doc.integ01.dev-franceconnect.fr/
[5]: http://openid.net/connect/
[6]: https://twitter.com/jumboweb
[7]: http://www.jumboweb.fr/
[8]: https://en.wikipedia.org/wiki/Single_point_of_failure
[9]: http://keepass.info/
[10]: https://www.dropbox.com/
[11]: https://twitter.com/dwursteisen?lang=en
[12]: https://tails.boum.org/
[13]: https://rsf.org/en
[14]: https://www.torproject.org/
[15]: https://www.debian.org/
[16]: https://freedom.press/
[17]: https://www.pidgin.im/download/linux/
