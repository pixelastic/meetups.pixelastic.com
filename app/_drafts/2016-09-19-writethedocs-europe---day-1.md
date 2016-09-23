---
layout: post
title: "WriteTheDocs Europe - Day 1"
tags: writethedocs
---

For the past two days, I was in Prague for the WriteTheDocs conference, along
with my friends from Algolia. First time in Prague and first time in this
documentarian community for me. Both were a success and I will do that again.

Two days of conference can be exhausting, and I even skipped a couple of talks
at the end of the second day, to let my brain rest a bit.

## Overview

From the very first talk of the event, I realised that I actually did not know
much about the documentarian community. I actually discovered that there is such
a job as "Technical Writer". The first speaker introduced himself as an
"Engineer", which sounded weird to me because I was expecting everybody in the
room to be engineers. With my developer background, it was a surprise that
engineers were actually a minority. I've always written the documentation of
the code I was writing, so having someone else doing it seemed like a waste of
time (and a great way to lose information along the way). Then, the more talk
I saw, the more I discovered that there is much more a TW (see, I even learned
the jargon) can bring.

Following a metaphor used in one of the lightning talk, a TW is both a private
investigator and a LEGO manual writer. It knows how to ask the good question to
the developer and write it in a easy way so others can build great things with
small blocks of information.

At different occasion during the event, I realized that what we do at Algolia is
unique and actually on the right track. We, the engineers, write the
documentation of the code we write. A feature is not complete until it is
documented. Often, it is when you write the documentation of a feature that you
see how complex it is, and that there must be a way to make is simpler to
understand to the user. And as we also do support on our own features, we know
where users are actually struggling and improve the documentation accordingly or
fix bugs. We like to do support, but we'd rather keep that to a minimal. So
writing good documentation and making sure the features are working correctly is
our way to limit the time we spend on support and is a very good motivation.
I might actually suggest a talk about that for next year.

## Documentation as part of the product

Speakers emphasized importance of getting close the actual source
of information (which can either be the developers writing the code, or the
support team answering the most common questions). Several talks mentionned the
SCRUM methodology of teams and sprints, and how the TW should fit in that
process, how documentation should be part of the DOD and shipped with the
product.

They pushed how important it was to have the documentation as part of the
product. How difficult it was to add it as an afterthought, or with one version
behind. This strike me as odd. Why would you do that? Documentation *is* part of
the project, just like tests are. Test are here to prove that your feature
works, if you don't have them, it's like your feature does not exist, people
won't use it. Same goes for documentation. If you don't have it, it means your
project is not finished, so people won't use it.

I started adding tests as an afterthought of an existing project. Now I do more
and more TDD. Same as I was documenting after writing the feature, I'm doing
more and more RDD/DDD and writing the documentation first, to have a goal of
what is the perfect API I want to achieve. Some talks mentionned the approach
and I find it very sound.

A product is outdated as soon as it ships without documentation.
Automate the boring tasks as much as possible (tests, lints). Use a CI for that.
So you can concentrate on where you really add value: content.
Make it easy to edit, put it on GitHub. If easy to edit, more people will do it,
even from the community.

## Writing tips

But what I'll essentially remember from the talks are all the small ways we can
improve how we write, be it documentation or anything else. There were a lot of
small advice throughout the days that I try to keep in mind, even writing the
very blog post.

Good sentences is how you run human words and ideas into someone else brain.
Syntax is paramount, and ambiguity must be avoided as it slows the process down.
Readers shouldn't have to read a whole sentence before getting the meaning of
it. They should be able to process it as it comes. It's the same as loading
a big file to RAM versus reading it line by line.

Remember that language is brain code. Every word will journey through the reader
mind. You must be careful to only send important information, as fast as
possible, and avoid overflow.

### Write drunk and edit sober

That's not a real advice, but gives you the idea.

You cannot write a perfect text in one go. Exactly like coders spend more time
editing existing code than writing new one, writers spend more time editing
their text than writing it in the first place. 

Both activities requires a very different state of mind so it's ok to write
a first (very imperfect) draft first, then edit it. It's even better to let it
rest for a couple hours or even days before starting the editing. In your draft
you don't bother about grammatical errors of even typos, you just dump the rough
ideas to have an approximate word count.

### Your audience is one person

A nice tip to be sure to always use the same tone and voice (which was another
concept nicely explained by Atlassian and Mailchimp), is to picture yourself
speaking to a friend when writing content. Imagine that you're speaking to
someone you know well and that could be interested in your content.

Just like when telling a story, don't end in the middle of cliffhanger. Always
end your documentation page with a satisfiable conclusion. Recap what was
learned, show what can be built with this knowledge, add links to further steps
in the documentation.

### Remove content

> If I had more time, I would have written a shorter letter

Writing is easy. Anybody can do it. Writing something that people will actually
read and remember is harder. Once again, it's exactly like in coding. Everybody
can write code, but writing a code that other people can understand and edit if
needed requires a great deal of rewriting. Same goes for traditional writing,
always check if there is content you can remove.

The advice is: remove what the reader will tend to skip. Remove the jargon,
remove the introduction. If unsure, do user-testing of your docs (use
eye-tracking if you can, insights are invaluable).

Write information in small chunks. In a very UNIX-like philosophy, each
paragraph should explain one thing and one thing only, but should explain it
clearly.

People will not read your doc in one go from start to end. They will search for
what interest them and will jump right in the middle of the page. You're not
writing fiction where you can build a world and a context. Each piece of
information should be self-explanatory.

### Give examples

Add code sample, that's what people are looking for in API documentations. Add
video tutorials for beginners, and interactive `jsfiddle` for more experienced
users.

A picture being worth a thousand words, adding screenshots or diagrams for
complex operations can be even better than writing.

### Read and watch series

All writers read a lot. Wittgenstein was saying that "the limits of my languag
are the limits of my world" and Blaise Pascal "Ce qui se conçoit clairement
s'énonce clairement". If you don't have a word for something, you cannot explain
the idea. As we're more and more writing in English, it's important to read in
English. And not only in our field. We should read novels, documentations,
blogs, etc. It gives us more ideas and ways to express nuances.

Also, series have the double advantage of teaching you "real" spoken language,
as well as becomin part of pop culture, and giving you references you can use
later. If you want to go even further, you can try to translate books from your
original language to English.

## Automating docs

Just like we have acceptance and non-regression tests in our code, we should
also have a way to check that our docs meet our standards and that they are not
deprecated.

A few tools and workflow were mentionned (HTMLProofer, TestTheDocs), to help you
find dead links and images and run some linter on the text to make sure if match
your guidelines.

Hemingway was known for writing concisely. Check the Hemingway spellchecker.

A styleguide was also mentionned several times. A shared document that
explicitly answer writer questions like: should we use active or passive voice?,
how should we name our headers?, with example. This is something we currently
lack at Algolia, but would greatly benefit us as we scale.




## Others bits

Special mention to Joan Wendt that despite an overly long and cheesy marketing
video for Google managed to captivate me. She has to write documentation for the
people building and maintaining the Google datacenters. Those are top secret and
very detailed manuals with pictures of every single step of assembly of every
single part of the building. I always enjoy this kind of insight into other
people special jobs.

There was a talk about screenshots in documentation, giving examples of bad
screenshots and giving some tips on how to make them better. With our constantly
evolving dashboard, we often have out-of-date screenshots. I was hoping for some
tips on how to keep them in sync in the best possible way. I also think that
a documentation requiring too many screenshots is a sign of a badly thought UI,
and should be fixed directly from a UX perspective.






https://docs.google.com/document/d/1Mr0vYuk6yP-OybDTQ_Zs1vBQsg7LxqlweM_oppJZVqw/edit#
https://docs.google.com/presentation/d/1wbzJUM6EGWrjiew36uZcYkmqLW34oH_8KolyCtkuocI/edit?usp=sharing
https://files.slack.com/files-pri/T0299N2DL-F2DLYBNMT/building_a_closer_relationship_with_support.pd://files.slack.com/files-pri/T0299N2DL-F2DLYBNMT/building_a_closer_relationship_with_support.pdf

Talk idea: Write blog post/talks like you write stories. The Writer's Journey.
Monomyth
