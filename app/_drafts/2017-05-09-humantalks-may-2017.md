---
layout: post
title: "HumanTalks May 2017"
tags:
---

This month HumanTalks was held at the Deezer HQ in Paris. We have between 80 and
100 people coming the HumanTalks each month (we're one of the biggest Paris
meetups), so finding companies with a room big enough to fit us all is getting
harder and harder. Deezer has such a room and has been hosting us once again.
Thanks Deezer!

## Bot Framework

We started with a tech talk, about chatbots. [Lucas Girardin][1] explained that
bots are getting smarter. They're no longer limited to "Press One for doing this
thing", "Press Two for doing that other thing" or "I did not understand". They
can now better understand natural language and can be used in more complex
process (like how GitHub uses [Hubot][2] for deployment).

Some people also use them as learning tools, in interactive apps targeted to
young users. Instead of reading the history book, you can actually discuss with
someone living in that era, asking them questions about their life. That's
a great approach.

But the most used platforms are the chat platforms. We have interfaces
around us everyday that we use for having conversations. Slack, Messenger,
Whatsapp. Even emails or comments. Add a virtual recipient as a chatbot and you
can plug it to any existing workflow.

![Chatbots][7]

The greatest strength of chatbots is not that they can masquerade as humans
(They cannot. Yet). It's that you can put them in all the existing
medium we already have without requiring people to add one more mean of
communication to their already busy life.

Lucas then went on doing a live coding of a simple bot using the [bot
framework][3]. This framework comes with a generic chat UI where we can test our
bot. All bots follow a pattern of:

1. Receiving a message
2. Identifying the Intent and Entities
3. Finding the most appropriate answer
3. Answering

_Intents_ are the type of answer expected. Are you asking for direction? Saying
hello? Or goodbye?

_Entities_ are the important parts of the sentence. When asking
for direction the entity would be an address. Otherwise it could be your name,
or a date, or the keyword you want to search for.

Most bots are simple. They have a long list of `if`/`else` branching, trying to
check if the questions contains specific words, and assigning Intents and
Entities to them. Today, thanks to the advances in Machine Learning and APIs we
can make smarter bots, by using cognitives services. Those services will know
that if you say "hey", "hello", or "good day sir", it all means the same thing
(ie. will trigger the same Intent). You don't have to explicitly list all the
words that should trigger. Instead, you trust the ML API to know what Intent it
should be associated with.

This is the tricky part. On simple examples like "saying hello", most ML
algorithms are ok (it's the ML "hello world"). But your bot will need
domain-specific knowledge, which means you'll have to train them. You'll have to
go through all interactions people had with the bot to correct it when it didn't
trigger the correct Intent. That's why you should never release your bot to your
whole audience in one go. You need to do it in phases, to make sure its learning
curve is ok.

Lucas ended his talk on sound advices:

- Explicitly tell your users they are talking with a bot. Don't try to pretend
  it's a human. Otherwise you might have angry users that will think someone is
  mocking them when the bot starts to answer wrongly.
- Be aware that your bot *will be* insulted, and if it's a female bot, *will be*
  sexually harassed.

Great introduction to bots. The bot framework seems a good place to start and
there seem to be both a [nodejs][4] and a [.NET][5] version.


## Animations are for human being

Francois Blavoet, Android Developer at Deezer did the second talk. This time it
was about animations in UI. Material Design was used as an example because it
follows animation best practices.

One of the main goal of animation is to _delight_ the user. It does not bring
any new feature to the app, but will work toward the branding and how people
will remember the app and their experience using it. In the crowded space that
is smartphone apps, great animations can sometimes be the one thing that will
make your app more attractive.

Animations also have a teaching function. Users don't have time to waste trying
to learn how your app is working. By animating parts of the screen, you can show
the user what is going on. You can add a smooth transition between two states
instead of jumping from one to the other directly.

Take the example of an email app. When a new email arrives in your inbox, you
could add it to the list right when it arrives. But the change might be too
quick for users to see it. Instead, by scrolling the list down and then fading
in the new email, users can see and understand that something happened. There
must be a continuity between the first step and the last one.

The principles on which great UI animations are based today are the same that
were used in the 30s by the Walt Disney movies. The main goal is to give the
illusion of life. Our eyes and brain are trained to see objects moving in
a specific way in the real world. When animating objects on screen, we need to
keep that in mind. For an animation to _feel right_, it needs to move like
something real would move.

![The Illusion of Life][6]

It means that when moving an element from one spot to another, it should not
follow a linear speed. No object in the real life can move instantly from
immobile to its max speed, nor go from its max speed to a stop instantly. There
is some acceleration or decceleration taking place. Same occurs in UI
animations. Elements should start slow and then accelerate. The animation should
not take more time, but it will be slower at first, then faster at the end.
François also suggested that it's better to use decceleration for items that are
entering the viewport and acceleration for items that are leaving it.

He also suggested that animation last between 200ms and 400ms. Anything below
200ms will be too fast for the human eye to catch and anything above 400ms will
be long enough that the user will see the delay. That's why 300ms is usually the
default value. Also important to keep in mind that the older you are, the
harder it is for you to see animations.

If you want to go deeper in the subject, the Material UI animation guidelines do
a great job of explaining _why_ their best practices are set this way. You can
also read the old _Disney: The Illusion of Life_ book. François also mentioned
[Project Phoebe](https://phoebe.xyz/) that takes a look at mutative design, or
how your design should evolve with your user knowledge of your app (you can make
slow and visible animations at first when your users discover the app, then
gradually remove them as they gets more used to it).

## Service Workers

Kevin Jean. Theodo (quelle surprise)

si pas de connection on joue au dinosaure dans chrome
frustré
si réseau lent, experience ralentie
si pas de dréseau, pas de user
comment on pet faire pour que on ne perde pas d euser même si pas de connection

serice woeker est un proxu entre les requetes du device et le network
on register un worker ees un fichier js
(jolie image de edge en troll)

on installe
si erreur dans le code, service worker pas lancé, sinon activé et iddle
on peut le tuer si necessaire
sinon un event fetch à chaque requete
par défaut, fait juste passerelle
sinon on peut faire son propre cache pour savoir où aller chercher les items
on peut le fire que si na  une erreur, genre quand pas de réseau, donc on peut
fallback quand on veut

online/offline ok
mais en vrai on a une situation ou le reseau est pas bon mais pas offline

offline first
on check dans notre cache en premier, et si pas de cache seulement on va dans le
réseau

question: on recode un systeme de cache. pourquoi pas intégré dans les browsers?
question: cache va plus vite, mais pourquoi ne pas configurer les headers pour
garder en cache plus longtemps?

question: comment on invalide le cache?
surtout, quand on invalide le cache? on peut garder sa stratégie dans le service
worker, pour chaque asset
pur mettre à jour le service worker, on change son nom (invalidation classique
depuis le html)

coté scuirté, le cache est limité apr domaine et service workers ne marchent
qu'en https

Meetup: Paris Progressive Web Apps
Hosting?

## CommitStrip

Se présente pas, estime que tout le monde le connait. Aurait du se présenter un
peu

Premier strip en 2012
puis ami qui déssine et lui qui fait le scénars
dessinait à la main au début, puis maintenant automatisé un peu, sait mieux le
sdessiner facilement, ont leur particulraité

WAC, We Are Coders, mauvais nom, pas de SEO
Change de nom, mais donne rien de plus
en fait avaient mis ça sur un serveur de dev bloqué par google

coup de boost par site web, gros pic de traffic
premier livre sur crowdfunding
Retweet par Docker, donne plein de visibilité
deuxieme livre
65% de visiteurs non-francophones

anecdotes sympas sur les strips qui marchent, les images, etc

question: rapporte des clients sur activité principale?
question: dessinateur fait ça à temps plein?


[1]: https://twitter.com/pykpyky
[2]: https://speakerdeck.com/helaili/chatops-at-github
[3]: https://dev.botframework.com/
[4]: https://docs.botframework.com/en-us/node/builder/overview/#navtitle
[5]: https://docs.botframework.com/en-us/csharp/builder/sdkreference/
[6]: /img/2017-05-09/illusion_of_life.jpg
[7]: /img/2017-05-09/chatbots.png

