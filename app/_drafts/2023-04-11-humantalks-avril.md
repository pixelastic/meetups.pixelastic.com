

At SII, like the previous NantesJS

# A team of 4 tech leads

Antoine Cellier

At Doctolib, each developer is a tech lead. Actually, they call it Tech holders,
not tech lead.

Problem he sses in a team is that people miht no know why do something, mihght
not care and might lack responsibility. This can come from a top down spec
approach coming from a PM. Design UI/UX can also be pushed into the team, or
even worse sometmes a "staff architect" will just choose the tech stack and you
have to apply it.

Needs to define the stragey, te KPIs, do slides to explain that. How can he
engage on estimates?

The slides gives me PTSD of my time there. Definitely not for me.


Siad that devs should only work 2h a day on "their" project and deliver the same
as usual

? Who should he present it to in the TH onboarding
? How can he engage himself on deadline, if it's a v0.1, and not overinvest in
scoping? Update the roadmap as it goes
? Why one week each time? Doesn't it depend on the size of the project?


? How can you do that while working on something else? In the before phase, and
in the release and performance afterwards?

? Said that would fix the fact that devs are only ficxing tickets, but this only
changes the fact that sometimes they are the one writing the tickets, but it's
still the same.


## Make your backend dynamic with HTMX

Alexis Lozano
360learning
salaires.dev

List of salaries if working. Big list, and a form to send data to the list

Used to be a backend with the db, a front, and a user. If I need to add a new
company: consultancy, big company, small company. Need to add the type in the
front (Elm, TypeScript), add a few methods to tranforme the string returned from
the back into a real type. Also need to update the form to create the dropdown

Also need to update the backend to transform the input into the type.

But issue is that neew to update types in the back and in the front, as well as
the input types.

Let's remove the front, and connect to the back. We need to update teh page on
each change. Works well with simple submit, but we don't want to update a page
on each dropdown change.

moved the validation at the backend, so each update sends a validation at the
backend, which returns a new html, which updates the form. This moves the
validation logic at one point

HTMX is a js library, that does the calls and update the markup. It's your job
to write the backend

One issue is that it requires a backend to work, and DDos, and internet
connection

Nice tool, does one thing but does it well.

# Me, the imposter

Joanne Gouaillier, Agile Coach
SII

Competency zone: confidence, mastery, habits, serenity. Send emails, but not
answer for jobs
Progress zone: motivational, change, learning. Send emails to an mail asking for
young, BAC S.
Risk zone: confronttation, danger. Weird that got answered back because
way outside of her zone.
Panic zone: fear, stress, insecurity, powerless

The impsoter is very lucky, all he does it's because of luck.
So either auto-sabotage, or hyper-investissement.
Pass the tests, so need to pass the interview ("they're stupid ")

What I know I know < What I know < What they know. False
What I know very different that what other know

The Cycle of imposter
auto-sabotage (préparer au dernier moment)
sur-préparation (doit en chier, fait beaucoup)
All very lucky, so can't take credit, so even more anxiety next time I'm asked

Will have a high level of "exigence" for themselves, and for others. So will be
disapointed.
Overestimate other people competency, so hire mediocre people
So will kill projects
Imposter can't take credit, will attribute that to "normal", or "luck". So
people will stop giving compliments

How to change
1. Know it exists
2. Observe the facts
3. Ask for feedback
4. Learn how we work

# Pull Requests and Code Review: How did we get there?

Julien Bourdeau

Given enough eyeballs, all bugs are shallow

Code review is good, let's do it all the time. Tool determine process rtaher
that process that determine the tool. GitHub provides a way to approve, up to
6 people.

Code is not perfect. We're not going to devaluate the code by merging a PR. Even
a simple readme can take days to be changed, so now I'd rather not even bother.

Pull requests are self-contained and pure. But no, we need to split them so not
too big. So you put in review, while working on another. So comments are on
stuff that will change, or already changed in the enw PR.

We assume that reviewing all diffs is the same as reviewing the whole codebase.
We only look at small diffs, but we lose the big picture by reviewing the whole
new code, not only the last diff.

Liar is that we're very rationale, we're not following emotions. We're only
manufacturing conflicts. Small one, but they add up. Either we accept and ask
for approval, or go through. Code Review is becoming a negociation. Consensus
Driven Development.

If always no, will stop reviewing, so say yes for an approval.

Review are mandatory, so *need* to do reviews, so *need* to add comments.
Creates conflict for nothing, add friction.

People can feel they have to approve, or review, even if too junior. Sometimes
people review without any context, they can't approve. Review and approve are
different.

Add comments and approve. People will read the comments and fix if needed.
Don't review compared to the best version there is, but to a better version of
  the actual code. If it's better than what it is, merge it.


