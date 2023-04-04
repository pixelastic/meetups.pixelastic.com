At Kanoma

Aleth Gueguen
Making website without frameworks. Everything is faster without framework.
Development is faster, becaus e alot of naive API. And also faster to run
because no overhead.

Advantages of PWA, nice because can update anytime. Sure, the UI is not great
because it's native basic. But for pro apps, that people are using only for
a few minutes, the goal is to be utilisatiran? So no need to be pretty, as long
as it works

Their appas are "backend for one person". The db is indexedDb, in the browser.
The "kinda" server s aservice worker. It can intercept all the request, so we
can make it work like a server. Just like we would call a endpoint, we can
intercept. Interetsing thing is that it works acy, out of the main thread, so
neer even bloc the rendering.
Prolem is that it doesn have acces to the DOM, so a bit of layer to communicate
and do the updates.

This kind of apps need an auotosave. You can do it with data binding and 2 way
bindings, but it uses JS proxies, wich is a bit slow. It's simple to use an
oninput on a form field, to store the whole fom (especially considering tha the
HTML/Js API alreayd has a way to serialize forms).

But how do you sync stuff with the server. You can use couchDb/pouchDb, or
theory of CRDT. This is very intelligent, but very complex as well. Better to
make it simple. Just consider one source of truth; the server is always right.
This is known as ptimistic Locking.

Learing: betterto have one db for the text and one db for the assets. Also,
there are some browser inconsistencies, some specific combiation won't work,
like a FormData with binary data in a Service Worker doesn't work in Safari.
Trick is to use a `PUT` with uploaded binary.

When many uploads at the same tme, especially in low connectivity is hard,
especially as the browser will kill servic workers sometimes if it thinks that
it's not doing anuthing.

Less code => More performance


# A backend in pure SQL
by Hugo Wood (@mercury_wood)

Coding a timesheet app, who does what when.

First, we create a table, with the date, consultant_id, the project_id.
We'll need to group by month, so we can create a type month with month and date,
and also domains in sql, to allow to add boundaries to the type

So we ca modelize compel datastructre just like typoing, directly in sql

SQL czn return specific headers, and can even parse JSON, and we can name
functions as we want. If we name a method `GET /path/sub`, we can add a proxy
that reads all the SQL functions and expose them

The main difference betwen SQL and classical compiled software is that the DB is
always running, so we can't eaisly redeclare afunctions, we ned to handle the
lifecycle of the table, but altering, updatingstuff. We cnat' drop everything,
because it would destroy the data as well. So how do we improve the DX here?

If we want to drope veryting and recreate, we need to drop and create in the
right order, because we can''t drop A if A is used by B, and we can't create
B if we didn't create A first.

How ti test?
There is no assert, but we can create alternaive tales with constraints. So if
we try to create a new value in the table, the constraint will fail, so we even
have a nice error message with the constrain failing and the line

But, how do we send emails or push data? Can't do it directly, but can add stiff
to a table to act as a queu and have an external process that read that queue
and using `select ... for update skip locked` we can assert i's oing to be
executed only once
Possible to use `notify` to use as a broadcast service

Posisble to have the db auto-update itself; whevenr youenter something in
a table, it could read it and apply it "as sql".

## Docusaurus
By Pierre Clainchard (@clainchoupi)

CTO at Kanoma. Loves to do documentation. Most of the time, he found that it is
hard to do documentation. So, how to imporove the DX, by using Docusaurus.

Built by Facebook internally, used by React an other FB products initially, but
open source and can now be use db any one and many OSS projects uses it. It's
a static website generator, so you uild it and you deploy anywhere. Can even
handle versioning and languages.

Support mrdx, the extended markdown that inculudes JavaScript (created by
Stripe?). You write the documentation in your IDE, commit and push, make the
doc as close o the code s possible.

Used to be on GitBook, but started to be paying, while Docusaurus is
open-source.

Simple `npx` command, have a home page, a blog, a doc he versioning, SEO, i18n
Sructure is based on the filesystem. No need to know React, just need to write
markdown, and can sprinkle some JS to improve it. Possible to import existing
React components. One page is one .md file. Easy to reason about and understand.

Demo with VSCode and GitLab. This automatically build the TOC, the pagination
through page, and the font sizing.

Possuble to import any React component, and add it to the markdown. There are
even Docusaurus specific components. Nice because it can be extended by a large
commu,ity, but needs to know React. That being said, that's really good to
build the documentation of a React project because the r=project coompnent s can
be inregrated in the documenattion directly.

Gave the example a `swagger-ui` component to add swagged endpoints directly.

Loved it, but didn't mention Algolia DocSearch
Used a search engine different from the basic one, CNFCMF that is built with the
build of docusaurus, and adds highlight.

## Discovering mobile development (without headaches)
Cyril Hue (@cy_hue) et Robin Caroff (@RobinCaroff).

Robin has been wokring in mobile since 2010, so he saw all the thing evolve so
i mijt have been easier for him. While Cyril just discover mbile coming from the
web, and had lots of question. This is when the dychotomy between there levels
of understanding became apparent and this talk is an attempt to fix that.

Web:
write code, compile, push, deploy and people click links and access it

Mobile, even is differet on Android and iOS, through a store.
People write code, and then they sign it (bundle or archive), with
a certificate. Push it to the store. And wait for review. Visible on the store, and people
download a version compiled on the fly for the user device.

The review can take between days and weeks. Upload the DevFestLille one month
before the event, was reviewed in 1 week. Added an update right after... took
one month and was after the event...

On the web, you host with your own server, yo do what you want on it, install
what you want. On mobile, we need to show our code, and people will validate our
code or not. 
Even for testing, need to do some marketing. Need to add a nice name, and
a great description, and nice icon and pictures. On mobile, it's not because it
compiles that you can upload it.
Submitting an app looks a lot like an RGPD text, you ned to explain why using
such permission, why that data, and what you do with it.

For an pdate on the webn if you add new code, you push a new version, you don't
really need to think about backward compatiblity. New version, you has the file,
you donwload the latest.
On mobile, can't force updating the app. Also, even if update the app, doesn't
update the underlying system, so need to think about backward compatibility.

The concept of store also works on other devices, like store on a mac, on
windows, on steam, or xbox. Those constraints might be here to stay, and we
might

? Certificat, per dev, par entreprise?






# Celadon


- Modelisation de la data (bacward compatible, think about the future)
  - Database hot in prod, cold for analysis
- Integration avec les autres acteurs (internes / externes)
- Décorellation le cycle de vie du billing system, du cycle de vie du billing,
  pour les engineers
- No hard coding. Pas de nom de fonction lié à un pricing, faire générique,
  parce que les équipes changent
- Build vs Buy? Stripe? Ziora?
- Contraintes légales
