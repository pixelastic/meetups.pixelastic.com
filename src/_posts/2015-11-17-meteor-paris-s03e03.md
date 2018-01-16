---
layout: post
title: "Meteor Paris S03E03"
tags: meteor
---

The last [Meteor meetup][1] took place at [Algolia][2], and I helped organize
it. I never coded in [Meteor][3] (yet), but I follow the technology from
a distance, and hosting the event was a really interesting experience.

I was actually quite surprised by the way the meetup is organized. There is no
defined agenda. People just raise their hands when they want to talk
about something. Some have slides, some don't. And once everyone has talked, you
can suggest subjects for open-table discussions for the remaining of the meetup.
After that it's a pizza buffet and networking time.

![Meteor meetup @Algolia](/img/2015-11-17/meteor.jpg)

## Fastosphere

The first talk was from [Vianney][4] and [François][5], the organizers. They
were not happy with the official repository of Meteor packages, called
[Atmosphere][6], and decided to code their own, called [Fastosphere][7]. They
scrapped the data from Atmosphere and pushed it to Algolia, in order to provide
a faster and more relevant search.

They both love what we do at Algolia, so we did not even had to do a speech
about us, they did it for us, and much better than what we could have done. They
showed a bit of code on how to push data to Algolia, and then how to search it.
They showed the dashboard, and the various analytics metrics you can get from
it.

Vianney even said "Algolia is too fast, we had to query their servers directly
because if we had gone through our Meteor server, this would have been way too
slow".

## Other talks

Then other people suggested talks. We talked about [Slack][8] bots done in
Meteor, to order from PopChef (french food delivery startup), or to [order
a Uber cab][9]. A guy also showed a [really nice looking website][10] where you
can upload your holiday videos and it will build a 2mn short video of the best
parts.

## Open tables

After that, two open tables were created to talk about Docker and testing.
I went to the one about testing and it seems that testing (end-to-end as well as
unit) is not something a lot of people do in the Meteor world. There are no
clear and easy way to test stuff, which in my opinion does not smell very good.
I did not attend the Docker open-table, but there seem to be a nice [git
repo][11] with all the needed information.

## Conclusion

I'm still impressed by the way this meetup is auto-organized and how it works
well. Even without knowing anything about Meteor, I had a really great time and
nice talks with the attendees.


[1]: http://www.meetup.com/fr/Meteor-Paris/
[2]: https://www.algolia.com/
[3]: https://www.meteor.com/
[4]: https://twitter.com/acemtp
[5]: https://twitter.com/peernohell
[6]: https://atmospherejs.com/
[7]: http://fastosphere.meteor.com/
[8]: https://slack.com/
[9]: http://devpost.com/software/slack-uber
[10]: https://www.clapnclip.com/
[11]: https://github.com/PEM--/devops-tuts
