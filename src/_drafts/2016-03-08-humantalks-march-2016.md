---
layout: post
title: "HumanTalks March 2016"
tags: humantalks
---

The HumanTalks event of March was held at Viadeo. There was a serie of ongoing
strikes in Paris at that time so a lot of people had to cancel their coming.

## Owasp Zap

First talk was by Paul Molin, from Theodo. He told us more about a tool he tried
named Owasp Zap. From is own words it is a way to make security fun.

Paul is used to work in an agile environment, where they push new features to
prod every week. This usually does not work well with the classical security
audi schema where an audit can take up to two months, and the code can have
drastically changed when the audit is finished.

The goal of the tool is to help developers find weaknesses into their own code
themselves. Zap is an open web application project, where you can try various
attacks on tailormade applications with vulnerabilities, as a way to practice
and learn. It comes with a lot of documentations and a few tools.

The Zap tool itself is perfect for beginners, but is also used by
professionnals. It works as a proxy between the browser and the server and
automatically modifiy the requests. It can for example automatically check that
form verifications enabled on the front-end are also enabled on the back-end.

He can work in a passive way, listening and recording every request, capturing
the one that are done from an admin and then trying to play them again with
a normal account to check that they are correctly blocked.

He can also crawle the whole website to give the list of all accessible links,
ensuring that no hidden content will actually leak. It also tests buffer
overflow, XSS and SQL injection issues.

It then generates a report of what it has found, ranging issues by criticity
with links to the explanation and how to fix them.

You can mark some parts of the page as being for guest or for loggued in users
(like a log-in form, or your name displayed in the header). It will then make
sure that only the correct part is displayed based on you status.

I'll conclude on a note about the legal aspect of the tool. It is illegal to use
it on a website if you were not explicitly allowed to do so. So better do it on
manour own websites, or someone else will do anyway.
