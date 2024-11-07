---
layout: post
title: "dotAI 2024 - Day One"
tags: ai
---

Last week I attended the dotAI conference. You'll find below a talk-by-talk
recap of all talks of the first day. I'm no data scientist myself, so many
details went way over my head, but I learned a lot, and had a very good time
there.

## Stanislas Polu, LLMs reasoning and agentic capabilities over time

The first talk was by Stanislas Polu, which explored the journey of AI's
evolution. He mapped out the significant milestones and discussed their
potential impact on the future.

{% youtube https://www.youtube.com/watch?v=8d1PtJBnAEM %}

Stanislas started with a graph categorizing AI tasks into three stages.
Initially, AI focused on mimicking human perception—recognizing speech and
identifying objects like cats or dogs. As it developed, AI began tackling more
complex tasks, like writing text and extracting structured data from chaos.

His conclusion was intriguing: AI might soon be able to think. Currently, AI
generates the next piece of information based on the previous one, lacking
foresight. The future could bring an AI that reasons and provides solutions
after some consideration.

He also shared insights from his time at OpenAI. Despite its efficiency in
performing human tasks, initial adoption was low. In 2022, OpenAI shifted its
focus to product accessibility by introducing a chat interface. This change
aimed to reduce barriers and encourage broader use of their technology, paving
the way for further innovation.

Stanislas touched on specialized models, like those that excel in games such as
chess and Go. While models like GPT-3 and GPT-4 show improvements, they require
significant GPU resources for minimal gains. We've reached a point where data
saturation limits performance improvements, even with additional computational
power.

Looking ahead, Stanislas sees the next step beyond large language models:
machines that can think. He mentioned his company, Dust (https://dust.tt/),
emphasizing that the current challenge lies in product development. For AI to
progress, its adoption within companies needs to increase.

To support this, he suggested creating pipelines that connect various agents on
platforms like Confluence, Slack, or Spendesk. His talk explored these concepts
and opened up discussions about future possibilities.

## Ines Montani, Reality is not an end-to-end prediction problem: Applied NLP in the age of Generative AI 

The second talk of the day was presented by Ines Montani from
[Spacy](https://spacy.io/), [Explosion](https://explosion.ai/), and another
company I can't recall. Her talk was vibrant and engaging, filled with memorable
catchphrases and punchlines. She discussed the world of software 2.0.

{% youtube https://www.youtube.com/watch?v=K_Y9wvGjNKw %}

In software 1.0, you write code, compile it, and get a functional program. To
improve it, you refactor the code for better results. Modifying the compiler
itself is generally not the approach to achieving more specific outputs.

In the software 2.0 realm, you feed data into an algorithm to get a model.
Improving this model involves optimizing and refactoring the data. Just like
with a compiler, focusing on model optimization hits a plateau, whereas most
progress can be made by refining the data.

Her talk emphasized the ability to refactor data, highlighting the importance of
quality over quantity.

Ines doesn't believe in a universal model that can do everything. She advocates
for specific models tailored to individual tasks for optimal performance. With
reinforced learning, applications can learn from examples to execute tasks
correctly. The quality of their output is more dependent on input quality than
on the model's quality.

She noted that this new paradigm is challenging for developers to embrace
because it involves working with a "black box" (the model). However, she
explained that machine learning can be modularized into small components that
interlock.

This modularization has all the benefits known in software engineering:
scalability of individual elements, respect for data, the ability to run
components locally, or test them individually, etc.

Ines shared a metaphor that I found very illustrative. She explained that in
early 20th century England, people often couldn't afford alarm clocks. So, they
hired someone to knock on their windows at the desired time. If someone back
then had access to machines to replace human work, they might have invented
a device to walk through the streets knocking on windows automatically, making
it the vision of "progress."

Today, with AI, we're in a similar situation. Instead of merely replacing human
tasks with AI, true innovation lies in reinventing how we accomplish these
tasks, akin to the invention of the alarm clock back then.

That's the essence of Ines's metaphor: beware of creating modern
"window-knocking machines" when more elegant and autonomous solutions exist. She
gave the example of shared calendars. If you're trying to find a common time
slot with someone in another time zone, you might imagine an AI accessing both
calendars and acting as a chatbot to find a mutual slot. It's a practical but
limited solution.

True innovation, according to her, is the approach of tools like
[Calendly](https://calendly.com/). By exposing available time slots, the tool
allows everyone to directly choose a convenient time, simplifying the task
without complex AI intervention, offering a more natural and seamless
experience.

Her talk demonstrated that AI can help us enhance what we're already doing
without replacing everything. It's important to continue splitting and
modularizing our systems rather than merging everything into a large monolith.

## Merve Noyan, Gain full control of your apps with Open-source AI

In the latter part of the morning, after the first break, we attended a talk by
Merve Noyan from [Hugging Face](https://huggingface.co/). This is when I started
noticing a recurring pattern in the presentations: many speakers seemed to
highlight their companies as much as, if not more than, the underlying topics.
Some did it more subtly than others, but it often felt like a parade of product
placements, with each company showcasing what they do.

{% youtube https://www.youtube.com/watch?v=n462RhDhbK8 %}

It's a classic at most conferences—a necessary evil we've come to accept. That
said, the talk from Hugging Face was far from the worst, and their open-source
orientation conveyed an interesting message of cooperation. She managed to
capture my attention and left me with a positive impression.

For an outsider like me, Hugging Face is starting to resemble the GitHub of
Machine Learning and AI. There are numerous models available that you can try
directly with the API, build with a Docker command, fine-tune, quantize, and do
many other things with terms I'm not entirely familiar with yet.

The speaker illustrated Hugging Face's role in the AI ecosystem, highlighting
its platform where developers can publish models publicly, enabling others to
test, use, or improve them through fine-tuning and other techniques.

She emphasized the importance of collaboration to enhance the overall quality of
models, showing that, much like in software engineering, the power of
collaboration and open-source creates the state of the art.

In this spirit, Hugging Face provides numerous open-source tools, facilitating
the improvement of existing models. For instance, she mentioned
[Whisper](https://openai.com/index/whisper/), whose first version was improved
thanks to a community fork on Hugging Face, so much so that the second official
version is actually based on this fork. This approach demonstrates the power of
community in the AI field, much like what we've seen with open source in
software development.

Her final message was that **open source will always win.** Her argument was
that historically, all proprietary models are now being caught up with by
open-source models with similar capabilities. There's a plateau where it's no
longer possible to add more GPUs for additional improvements. Even with a lot of
money in a big company, the GPU capacity for training won't yield significantly
better results. However, optimizing the model at the data input level or through
parameter distillation makes it more efficient, lighter, and faster. This can be
achieved through the community to which they provide plenty of SDKs.

There was a very interesting aspect of what Hugging Face is doing at this level.
I was puzzled at times by certain terms used, like "open source," which seems to
have a different definition in the AI field than what I know in software
engineering.

My personal reflection after working in a large company is that open source
allows for incredible innovation. We can use libraries created by others to
improve something without having to build everything ourselves. Large companies
have tremendous inertia; they can put a lot of GPUs behind their projects, but
the return on investment eventually stagnates.

The only thing of real value is collaborative improvement. With open-source
models, this improvement must be tested by real users and their data to analyze
performance and results. You can create the best model theoretically behind four
walls, but it is imperative to have it tested by real people, and in that sense,
a public development model like Hugging Face offers is an incredible resource.

## Sri Satish Ambati, Democratizing AI with Open Source Multi-Agent Systems: Advancing the Future of Workflow Automation

Later in the morning, there was a talk by Sri Satish Ambati.

{% youtube https://www.youtube.com/watch?v=Bx5wgHXBhhE %}

Honestly, I must admit I didn't retain much. The presentation was quite hard to
follow: he spoke continuously, stringing words together without real pauses, and
the slides were not at all in sync with what he was saying.

He jumped from one idea to another without apparent transitions, and he changed
slides mid-sentence, scrolling through his list of slides without ever stopping,
making comprehension even more difficult.

In the end, he was even interrupted by the moderator for running out of time,
adding that he could have said much more. Unfortunately, I have no clear memory
of his message, and it left me with mixed feelings about H2O, still unsure of
what they actually do.

## Lightning Talks ⚡

Early in the afternoon, after a good lunch and a good coffee, we got back in the
room for some Lightning Talks (which were
quite long, about 10 minutes each).

The first lightning talk was presented by Daniel Phiri from
[Weaviate](https://weaviate.io/), a vector database. Daniel was one of the first
to introduce the concept of multimodality, a theme that resurfaced frequently
throughout the event. His metaphor particularly stuck with me: he compared our
interaction with AI to human perception, which involves five senses. Currently,
when we interact with AI, it’s often in a one-dimensional way, like through text
or voice, but rarely by combining multiple modes of communication.

{% youtube https://www.youtube.com/watch?v=Vpzm0a2qU2E %}

Daniel explained that to move towards a more natural and human interaction, AIs
need to incorporate this multimodality, akin to preparing a complete dish rather
than just offering the smell, taste, or touch separately. He argued that to
truly advance, AI must integrate all these aspects coherently.

He also mentioned that a lot of effort is still focused on what he calls the
"plumbing" of AI, which involves connecting different systems so that
information flows correctly. For example, transforming generated text into
a JSON structure, or ensuring that various types of data can coexist in a common
vector space. We’re still in the early stages, but Daniel sees this multimodal
integration as a crucial step for AI's future, where each "sense" generated must
work together smoothly and naturally.

Next, Audrey Roy Greenfeld gave an excellent talk on how they've used machine
learning to generate fake news, like on [The Onion](https://www.theonion.com/).
It was a concrete example: they had fun playing with a model to generate
sarcastic fake news. They realized it works. And it works so well that they
spend their time reading the generated news to validate them.

{% youtube https://www.youtube.com/watch?v=VchFkzsgXJg %}

Since they then became the bottleneck in determining which ones are funny and
which aren't, they automated the process. How do you get the tool to
self-analyze the quality of the jokes? The problem is that it now starts making
jokes in its analyses. If it's the same tool fine-tuned to make jokes and to
assess if the jokes are funny, it keeps making jokes in its analysis. So, they
had to use two different elements.

To ensure diverse perspectives, they generated a galaxy of fictitious
characters, who would be the fictional authors of their fictional articles. By
varying the characters, even if they are randomly generated (they had 300
different ones), it allows for different jokes that don’t all sound the same.
Even if they couldn't revisit exactly the characteristics of the character in
question, it produces different outputs. Excellent talk.

Then, Maxim Zaks talked about a programming language called Mojo. He made
allegories with Modern Family and showed that Mojo is a new language that
simplifies things. It’s not really an overlay on Python, but it’s interesting
because Python is the default language for many things in Machine Learning, and
it uses similar paradigms to be easy to learn. Mojo draws from Python’s syntax
to make simple things easy and complex things possible.

{% youtube https://www.youtube.com/watch?v=-AQ2sgO0Iu4 %}

Afterward, Grigory Dudnik gave a talk that I found very difficult to follow on
how to create practical applications and help developers write better code. He
addressed the challenges to resolve for tools like [GitHub
Copilot](https://github.com/features/copilot) or [Cursor](https://cursor.dev/)
to work, but I struggled to follow and couldn’t summarize his points.

{% youtube https://www.youtube.com/watch?v=XwVkA5ZLleY %}

## Steeve Morin, ZML: ML framework for Zig

After the lightning talks, there was a presentation by Steeve Morin, who
introduced us to ZML. It's a build pipeline for creating models and running them
on any platform, not just NVIDIA. I wasn't too aware of the rivalries between
different players, but Steeve seemed to be on a crusade specifically against
NVIDIA. ZML is a proposal to develop without being tied to a specific platform.

{% youtube https://www.youtube.com/watch?v=hLHITkWb77s %}

ZML utilizes four existing technologies within the ecosystem. There's
a programming language named Z, similar to Mojo, for writing models.
[Bazel](https://bazel.build/) is used as the build platform. There are two other
components whose names I didn't catch, but they enable cross-compilation for
different platforms.

Their goal is to simplify the developer experience with command-line tools.
These tools allow for building across multiple platforms and producing a single
binary that's compatible everywhere. No need for multiple binaries; one is
enough.

In conversations with others, it seems widely acknowledged that NVIDIA holds
a dominant position and that alternatives are needed. Steeve advocates for
a community-driven and open-source approach by using existing tools and giving
people the freedom to choose their own providers.

ZML offers cost flexibility by allowing users to switch providers based on needs
and budget, facilitating the use of different providers and ensuring ease of
transition.

So, ZML seems promising. The questions posed after his talk show a genuine
interest in open source and the fight against NVIDIA's dominance. Steeve aims to
ease the creation and execution of code on various platforms with an optimized
developer experience, which I greatly appreciate.

## Yann Léger, Serverless Inferencing: an infrastructure point of view

The last talk before the break was on inference, presented by Yann Léger.
I initially struggled to understand this talk because I wasn't familiar with
what inference meant. I finally grasped that inference is what happens at the
end of the chain; once a model is trained, inference is when you query it.

{% youtube https://www.youtube.com/watch?v=vxZpQh6Ymdo %}

What's important during inference is speed, which should be roughly equal to
reading speed, as it's an input used by a human.

Yann has built a system that allows inference at the edge, meaning as close as
possible to the end-user. You deploy your model there, which enables scaling
inference nodes in specific areas.

In this talk, I again felt that speakers often focus on presenting their
specific solutions. They address a problem—here, inference—and how they solve
it, but instead of providing practical advice applicable to everyone, they
mainly describe how they handle it within their own company. This gives the
impression of proprietary product placement rather than a genuine session of
sharing best practices.

The talks that stood out most to me during the day were those that avoided the
"product placement" format and had a long-term perspective. All those with
a long-term and sustainable vision advocated for open-source. In contrast, those
focused on short-term plumbing solutions were affiliated with a company.

This talk raised an important issue, but I would have appreciated more depth on
the problem itself and long-term solutions to address it. The approach was too
centered on "how we solved this problem, trust us, and use our service so you
don't have to think about it." The truth is, I have no guarantee that this
company will still be around in five years, whereas I know the problem will
remain. To move forward, I would have preferred to see us find solutions and
best practices together, rather than rely on a commercial solution that masks
and abstracts the problem.


## Pierre Stock, The future of Edge Agents

The next talk, from [Mistral](https://mistral.ai/), was one of my favorites of
the day. It focused on LLM at the edge, in embedded systems, when there’s no
internet connection available and it needs to run on users' phones or computers.

{% youtube https://www.youtube.com/watch?v=Pz9YeBs_afo %}

What I found interesting was that it was a very specific topic, and the speaker,
Pierre Stock, explained it very well.

Unlike other talks that didn’t always have clear topics, this one did. Coming
from Mistral, I appreciated their ability to explain complex elements simply,
demonstrating a deep understanding. They discussed the number of parameters in
a model, measured in billions. These parameters take up a lot of space and must
fit into limited RAM.

To achieve this, they use a technique called quantization. This involves
reducing the number of parameters by approximating them to values between 1 and
255, which reduces size while maintaining some quality of response. But that’s
not enough. A second phase of quantization further reduces complexity and
quality by assigning values between 1 and 16 to the parameters.

To minimize information loss by reducing scale, they train their model to be
resistant to the noise created by this quantization.

I loved the explanation because it was clear, like sharing a tip without using
complicated words, and without claiming it was a "secret sauce." They also
talked about caching in the KV (Key Value Store) to generate tokens more
efficiently. Honestly, that part went over my head (especially the sliding
windows part), but I still gathered that they knew what they were doing, and
their approach was very transparent and smart.

The talk was very interesting because the speaker explained complex concepts
simply, showing his mastery of the subject. He gave concrete examples and
answered questions honestly. I liked their fun and modest approach.

In the Q&A, he mentioned that while we’re making a lot of progress in AI,
**adding black boxes creates problems for the future.** He prefers to resolve
existing black boxes before tackling new problems. I really like this philosophy
because it emphasizes understanding and transparency in systems.

As a developer, I agree with the idea that if I can’t explain something, it
means I don’t understand it well enough to improve or debug it properly. This
talk really resonated with me and aligned with my own concepts and experiences
in development.

## Dr Laure Seugé & Arthur Talpaert, More empathy and health data protection in AI: announcing a primary care revolution.​

The next presentation was from [Doctolib](https://www.doctolib.fr/). While
I thought the one from H2O was the worst of the day, Doctolib's presentation set
a new low. I found it extremely awkward and out of place. It was truly
uncomfortable, and I almost considered leaving the room.

{% youtube https://www.youtube.com/watch?v=k3goK4kgqj0 %}

Perhaps it's my background as a public speaking coach talking here, but
I noticed many red flags—things I usually advise against in presentations.

**Two Speakers:** The presentation began with two speakers, a delicate exercise
that only works if they offer different perspectives and are used to working
together. Here, one was a doctor and the other a technician. This could have
been interesting, but the lack of natural interaction felt like poorly executed
acting. The presentation might have been more effective if delivered by just one
of them, especially since the tech role wasn't particularly technical.

**Not a TED Talk:** They probably aimed too high with TED Talk-style phrases,
starting with "Imagine a world where..." without even saying hello. Their
intention to inspire fell flat and created an awkward atmosphere.

**No Introduction:** They failed to introduce their *use case*, assuming
everyone knew Doctolib. While this might be true for a French audience,
presenting to a European audience required more humility. Explaining their *use
case* would have helped everyone understand the context.

**Product Announcement:** Their presentation felt more like a *product
announcement*, focusing on a new feature without detailing the technology's
workings. In a technical setting, more information on the underlying
technologies and challenges was expected.

**Video:** They used a video in a relatively short talk. In 18 minutes,
dedicating 5 to 6 minutes to a video seemed excessive. A shorter video would
have sufficed, as the main idea was clear from the start. Additionally, showing
the video in French to an English-speaking audience seemed like a lack of
adaptation.

**Poor Slides:** They had few slides, making it hard to follow and limiting
understanding. One slide on data transmission was too confusing, needing
breakdown into parts. Other slides were disconnected from their speech, diluting
their message.

I must admit my critique might be a bit emotional, as I've worked at Doctolib
and helped colleagues prepare for public speaking. My focus is not to criticize
them harshly but to see them do better. They had content that could have
captivated the audience, but it was undermined by the presentation format. It
was a missed opportunity for an engaging presentation.

Despite the presentation's weaknesses, discussing with others during the break,
what stood out was the speakers' genuine enthusiasm. They were visibly proud and
happy to present their work. Even though the presentation had its flaws, you
couldn't help but feel happy for them, seeing them so passionate about their
success.

## Romain Huet & Katia Gil Guzman, Building with OpenAI: What's Ahead

At the end of the first day, there was a conference from
[OpenAI](https://openai.com/). I expected it to be presented by Romain Huet,
whom I've met in the French startup ecosystem. He was previously with Stripe,
and I was looking forward to seeing him again. I remember being surprised when
I watched the OpenAI keynote and saw Romain take the stage. I had no idea he
worked there. It felt like two worlds collided for a moment.

{% youtube https://www.youtube.com/watch?v=KDSSraX8SHE %}

Ultimately, they made the call from San Francisco. Romain did an introduction,
and Katia, an OpenAI developer advocate, conducted the demo on stage. For
a while, I wondered if Romain was an AI-generated or if the call was
pre-recorded. There were few interactions between them, which is understandable
given the challenge of making an engaging talk with someone on the other side of
the planet.

Romain made remarks about some things not going as planned in the live demos. We
all know live demos don't always go as smoothly as rehearsals. Despite this, it
was a fascinating talk. As a developer advocate, I must commend Katia's work.
She was incredible on stage, perfectly at ease and completely mastering her
subject. She answered complex questions and performed a live demo without
stress, even when everything didn't work perfectly.

Katia showcased OpenAI's advanced voice capabilities, explaining how you can
have a live conversation with the agent. Currently, when using ChatGPT, you talk
to your phone or another system. The Whisper model transforms your speech into
text, which is then sent to GPT for a solution. GPT responds in text, and this
text is converted to audio so you can listen to the answer.

It's somewhat like a walkie-talkie conversation where each party must wait for
the other to finish speaking before responding. This slows the process because
multiple transformations are required, and information can be lost along the
way.

They also discussed multimodality, allowing communication with images and sound
simultaneously. The demo was impressive: they showed how to navigate a solar
system by voice using a 3D rendering application in the browser.

They indicated that this feature is available in the United States and will soon
be in Europe. It was an excellent demo to conclude the conference.

Katia faced interesting questions, including about generating different voices
and potential identity theft risks. Her response was clear: just like with
email, there will always be people who misuse new technologies for malicious
purposes, but that shouldn't stop us from using them.

It wasn't my favorite talk because the information presented was already known
to me from other OpenAI conferences and product announcements. However, it was
very impressive and well executed. It was a good way to end the day with
something polished and impressive.

**There was nothing to fault in this talk: it was exactly what I expected, no
more, no less, with excellent quality in both execution and presentation.**


## Conclusion

Attending an AI conference often leaves one unsure of where the content will
fall—between surface-level buzzword bingo or highly technical discussions that
at least 5 PhD to understand. 

Here, the talks struck a balance, aimed at a tech-savvy audience building AI
tools and tackling shared challenges. Some sessions dove into unique use cases
and specific issues, which I found fascinating and full of insights. Writing
this summary took time, but it's only the start. With a second day of talks
ahead, I’ll be sharing more soon, and I encourage everyone to check out the
upcoming content.
