On March 16, I attended the [Paris AI
Meetup](https://www.meetup.com/fr-FR/artificial-intelligence-meetup-paris/events/292088794/)
at [Ekimetrics](https://ekimetrics.com/fr/). The topic was on "How to
drive a ML project?" and was presented by a panel of 4 Data
Scientists.

We had Victor Billette de Villemeur (L'Oréal), Sharone Dayan (Contentsquare),
Léo Grosjean (Servier) and Paul-Louis Nech (Algolia).

## The main challenges of AI today

One of the main challenge of AI they cited, was the difference between the lack
of trust from some people and over-reliance from others. Some people would
discard anything that includes the name AI as yet another chatbot fad, while
others will embrace it without critical thinking.

But the one challenge they all agreed on was about uncertainty. Everything in
a ML project is tainted by uncertainty. 

New papers get published all the time and it's hard to stay up-to-date with
a constantly changing state of the art. Even with the right model in place,
knowing if the results you found are the best to be found is highly uncertain.
Contrary to classical software projects, that might be fundamentally
mathematically proven, ML project rely on estimates at their core.

## How to limit the risk of the estimati

Estimating the time to complete a task in ML is very
different than estimating one for a regular software engineering project (which
in itself is already a perilous exercise).

Sharone Dayan advocated for an iterative process, where she would engage with
sponsors and stakeholders at the beginning of the project. This will create
a trust contract, what to expect and what is not possible. The goal is to define
the needs, not the expectations, and define baseline metrics to follow weeks
after week.

ML projects are research scientific projects. You don't even know if you'll find
the answer to the question, and there is a real risk of sunken cost
fallacy. 

The best way to limit the risk is to apply agile principles: fail fast and learn
faster. They work in increments of two weeks, where they define a small target
and move by baby steps. And if it means hacking and cheating their way to solve
the needs, that's OK. You don't need a large ML model when your problem can be
solved with regexps, `if`/`then`/`else` and simple tests. Start simple and build
from there.

## From hacks to production

Sharone goes into more details of explaining her [6-steps ML project
lifecycle](https://engineering.contentsquare.com/2022/typical-ml-projects-lifecycle/).
It all starts with Scoping, Exploration and Proof Of Concept.

Those three phases are enough to see if the project should be released or not.
It forces you to focus on getting high quality data. If you can't get the right
data, there is no way your model will ever perform well. Once you've managed to get
a POC online for a couple of users, you have a way to prove (or disprove) the
value of the project.

If it's not worth it, you can still ditch it and move to another project. If it
has proven its value, it's now time to scale it. First, she suggests check for
ways to generalize the models, and learn from experimentation with live models,
deployed in production. From there, it's about monitoring and packaging the
models into a real consumer-facing product, and finally handle the transversal
use-cases.

The key is to focus on making sure what you build is actually used by someone.
Put your v1 in production as a POC, and immediatly start working on the V2.

## Is "good enough" good enough?

In some cases, you still need an algorithm in production that is very good, not
just good enough, like a face recognition algorithm. You can't have false
positives, and you need to have trust in your model to correctly work.

But because all of that is still scientific research, it's totally possible that
after thousands of hours of work, you're still not able to do it correctly.
Maybe it's time to stop. Maybe it's not worth it. It's not because you've
invested a lot of time and money in something that you need to invest even more.

## Various roadmaps

How to reconcile the Product Roadmap, with clear release dates and features,
with the Machine Learning roadmap?

Paul-Louis noted that a key to success in his opinion was to have muti-skilled
teams. Data Scientists, Product Managers, Engineers, ML Ops people, etc. It's
important to have all the people involved in the project around the table, to
more quickly surface blockers and have the expertise of what makes a ML project
spread to members that are not specifically Data Scientists.

As mentioned, timeboxing is key, as are regular updates. If you give updates
often, you're less likely to be judges as always changing the expectations.

One has to be very careful into finding the right balance between Tech and
Product. If you focus too heavily on the Tech, you'll most likely be using all
the shiny new models and algorithms without really knowing what your users want.
On the contrary, if you focus too much on the Product, you lose your decisive
edge and can no longer innovate and stay ahead of the trend.

But deadlines are a fact. We can't just use all the new shiny new tech; we need
to deliver. This is where timeboxing, small increments, and multi-skilled teams
help align.

## But our users wants ChatGPT everywhere!

It can be very hard, and frustrating, to keep our projects small and hacky when
everyone is expecting to have ChatGPT-like quality in all their tools. Not
everyone is OpenAI.

The user expectation today are way beyond what most teams can do. Our job is to
educate people, explaining them how it works, what's inside the black box. We
need to explain the importance of data, and how to differenciate good data from
bad data.

Explaining how things works will level the expectations and reduce frustration
on both sides. But more importantly, builders need to listen to the feedback of
their users. People are keen on sharing how they use the products, why it works
(or not) in their use case, etc.

Companies should create a "feedback lake", where all feedback is entered, along
with a tagging system to group feedback about a specific use case together. This
would make prioritization easier, and will prevent you from handling feedback
one by one. Remember, the plural of anecdote is not data. Group things, and work
on fixing the big pictures rather than the symptoms.

You also need to prove to users that their feedback is taken into account. This
will increases the quality of the feedback but also the overall quality of the
product.

## How to deal with sponsors

The conversation then moved to internal sponsors inside a company. Sponsors are
important; they are your stakeholders and even if they don't actively
participate in the development, they are as interested as you in your success.

The key to keep your sponsors happy is communication. You need a vertical
communication channel to report updates and receive informations from them. You
also need an horizontal communication channel to talk with people from other
teams or with other skills working on the same product.

Sponsors are solution-oriented, they are (mostly) rational. They want to know if
it can be used or not. They want clear solutions about "can it solve my
problem?". Sometimes ML is not the solution.

We need to educate and evangelize them, just like the others. We need to have
explainability tools. We need to heavily invest in tools to explain how what we
do work. Diagrams, data visualisation, debug tools, documentation, examples,
playgrounds, etc. Pictures are worth a thousand words, so let's 

Whatever it takes to explain how it works. We should strive to have everyone
around us have the same level of education on ML projects, so we can speak the
same language. We need to be able to explain, in simple words, how things work. 

People either think ChatGPT is scary, or magical. Scared people don't act
rationally, so we need to clarify, demistify and explain how it works. On the
other hands, if they perceive it as magical, they will create misconceptions
about it, and will inevitably be disappointed.

Now more than ever, we need to invest on standards, and be careful not to create
a new Web 2.0 bubble. We need to make knowledge about the inner working open, so
we don't end up in a situation where only a handful of companies have a monopoly
on ChatGPT and similar products.
