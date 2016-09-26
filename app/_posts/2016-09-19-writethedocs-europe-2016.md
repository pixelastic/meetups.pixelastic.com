---
layout: post
title: "WriteTheDocs Europe 2016"
tags: writethedocs
---

Mid september I was in Prague for the [WriteTheDocs][1] conference. I went there
with [four][2] [of][3] [my][4] [colleagues][5] to learn how to improve our
documentation. We discovered much more than what we initially expected.

![Stickers][6]

## First impression

From the first talk I realised that I actually did not know much about the
community that I had joined. I expected it to be composed of those developers
that also write documentation and enjoy it. But when the first speaker
introduced himself as an engineer, and that it apparently was something worth
specifing, I knew that I was going to have some surprises.

I then discovered that there is such a job as "Technical Writer". After two days
of conference I'm still not sure what it means, to be honest. From what
I gather, they are people with skills in writing and they know how to convey
information in a clear and concise way. They can translate complex concepts into
simpler words so others can understand them with minimal effort. A technical
background is not mandatory, but asking question is paramount. They have to
deeply understand the subject to be able to synthetize it.

## Documentation is code

Throughout the conference, I saw talks explaining how important documentation
was and why it should not be added as an afterthought. People were exposing
issues in the way documentation was done, and suggesting ways to fix those
issues.

At their core, issues people had with documentation were the same issues we have
with code (quality, bloat, complexity, etc). The suggested solutions were also
the same we apply to code (user testing, automated testing, linters,
short feedback loops, etc).

## Language as code

Good writing is how you run words into someone else brain to spark ideas. It's
not different from a code you execute. If you write bad code, your code
will do bad things. This is exactly as true for documentation.

Documentation is as important as code, because it *is* like code. Language is
brain code. Every word will journey through the reader mind. You must be
careful to only send important information, as fast as possible, and avoid
overflow.

Syntax is paramount, and ambiguity must be avoided as it slows the process down.
Readers shouldn't have to read a whole sentence before getting the meaning of
it. They should be able to process it as it comes. It's the same as loading
a big file to RAM versus reading it line by line.

## Docs or it didn't happen


Documentation is as important as code when it comes to features. If
undocumented, any feature is outdated as soon as it's shipped. If you're in
a Scrum environment, then it means documentation should be part of the
[DoD][7] of any feature.

As a developer, I will always add tests for any new feature. This is how I can
prove that the feature is working. Writing documentation is proving that the
feature actually exists.

![Docs or it didn't happen][8]

If you see a GitHub repository with an empty `readme`, you'll assume the project
is unfinished. If you see a project without documentation, you'll assume it's
not usable.

This is even more true if you're documenting an API. User testing with
eye-tracking showed it: when confronted with a new API, everybody
searches for the documentation first. Then they look for live examples and
code samples.

And like tests, the logical next step is the documentation equivalent of
TDD: Documentation Driven Development. Start by writing the documentation, and
then write the feature. Documenting the user-facing API before writing any code
will let the best API emerge by itself.

## Write drunk, edit sober

As developers, we spend more time fixing bugs and adding features than coding
the initial skeleton. The same happen when writing documentation. Great
documentation requires hundred of tweaks and rewriting and no-one ever did it
right on the first try.

Writing and editing requires vastly different state of mind. Write a first
draft to dump your ideas. Don't bother with typos nor grammatical errors, but
write down all you want to say, to get a rough word count. Then, let it rest.
A couple hours or even days, before editing it again.

## Keep It Simple, Stupid

Define a shared Styleguide, with the [voice and tone][9] you want to keep
consistently through your documentation. Your readers should not feel like they
are reading a different author on each page.

Writing documentation is easy. Anybody can do it. What is hard is to write
something that will be understood and remembered by the reader. The key is
brievety and simplicity. Remove words and sentences until you think there is
nothing left to remove. Then remove some more. And remember what [someone
famous][10] once said: _If I had more time, I would have written a shorter
letter_.

People will come to your pages from search engines. They won't read from top to
bottom but can jump to any part of the page. They will scan the content, so help
them identify what each section is about. Each of your paragraphs should
explain exactly one idea and should explain it clearly (in perfect UNIX-style).

## Tips'n'tricks

A good story ends with a satisfying finish, not in the middle of a cliffhanger.
At the end of any page, list what has been learned, show what can be built with
this knowledge or add links to the next steps.

[Tools][11] can [make][12] your [life][13] easier. They can even be
pluggued to a [Continuous][14] [Integration][15] [service][16]. Don't waste time
doing what a computer can do better and faster than you. Focus on where you
bring value.

![Support][17]

Spend time with your users. Immerse yourself into the support team and see the
real issues your users are facing. Schedule regular [user-testing sessions][18].
They are an invaluable way to know the real issues that need documenting.

Add code samples because that's the first thing developers read. Add video
tutorials for beginners and interactive [jsfiddles][19] for experienced users.
Don't hesitate to add pictures to explain complex concepts.

All good writers are avid readers, so *read*. It will give you more words to
enrich your vocabulary, so more ways to express nuances. This is even more true
if you're [not a native english speaker][20]. Translating books into other
languages is also a great way to improve your writing skills.

## Conclusion

Even if not exactly what I was expecting, the event was a success. We all
learned a lot, met interesting people, and even had the chance to pitch
[DocSearch][21]. I think I will come again next year.


We will maybe even suggest a talk, because I feel that the way we write
documentation at [Algolia][22] is on the right track, even if a bit special. We
write the documentation of the feature we develop, and we also do the support
for it.  It puts us in a virtuous circle of feedback, bug fixing and
documentation enhancing.

We like doing support, but we'd rather spend our time on adding new features. So
enhancing the documentation and fixing bugs is our way to ensure that we spend
less time on support and is a good motivation.

Thanks to all the organizers, speakers and attendees and hope to see you next
year!


[1]: http://www.writethedocs.org/conf/eu/2016/
[2]: https://twitter.com/maxiloc
[3]: https://twitter.com/proudlygeek
[4]: https://twitter.com/AdamSurak
[5]: https://twitter.com/JanPetr
[6]: /img/2016-09-19/ticket.jpg
[7]: https://www.scruminc.com/definition-of-done/
[8]: /img/2016-09-19/docs.jpg
[9]: http://voiceandtone.com/
[10]: http://quoteinvestigator.com/2012/04/28/shorter-letter/
[11]: https://testthedocs.org/
[12]: https://github.com/gjtorikian/html-proofer
[13]: http://www.hemingwayapp.com/
[14]: https://travis-ci.org/
[15]: https://circleci.com/
[16]: https://jenkins.io/
[17]: /img/2016-09-19/support.jpg
[18]: https://hackernoon.com/how-to-build-your-own-diy-user-testing-setup-for-just-129-9ead745a6a74#.dfrmhgg1b
[19]: https://jsfiddle.net/
[20]: https://docs.google.com/presentation/d/1wbzJUM6EGWrjiew36uZcYkmqLW34oH_8KolyCtkuocI/view
[21]: https://community.algolia.com/docsearch/
[22]: https://www.algolia.com/doc
