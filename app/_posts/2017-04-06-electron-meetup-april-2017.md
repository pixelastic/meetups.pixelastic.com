---
layout: post
title: "Electron Meetup April 2017"
tags: electron
---

Tonight was the Electron meetup in Paris. I didn't even know Electron there was
a dedicated meetup. I went there because my coworker Baptiste was doing a talk
and I wanted to support him. I'm glad I went because I learned a lot.

## Auto-update in Electron

Baptiste talked about one of the internal applications we are using at Algolia.
The app lets the Algolia employees search into content that is spread across
different other apps. Using a simple search bar, we can search in GitHub issues,
Asana checklists, HelpScout tickets, Salesforce leads, Confluence pages, etc.

He talked about the auto-update mechanism. Electron apps being desktop apps,
people have to install them on their machine. Developers cannot push new content
as they would do for a website. They have to have an update mechanism in place,
and it has to be automated because they cannot rely on users manually updating
their version.

Baptiste used a system call Nuts, a node app that you can host on Heroku, and
that works as a middleware between your GitHub repo (where you pushed the new
builds), and the installed applications.

When the application starts (and every 5mn after that), it checks if a new
package is available by contacting the Nuts server. Nuts in turn will query the
GitHub repo (using auth tokens if the repo is private). If a new version is
available, Nuts will forward it to the application that will download
it in the background. If no version is available, nothing happens. Both those
cases are handled in Electron through events fired in case of an update
available or not.

Now that the technical part is over, you have a lot of UX questions to ask
yourself. What do you do with this new version? Do you install it without your user knowing? Do you ask confirmation first? Do you install it
right away or do you wait for the next session?

At Algolia, we decided not to install new versions silently. Most of the users
of the app are developers, and they want to know when they update, and which
version they are using. They don't like too much magic. From a pure debugging
standpoint, it was also easier for Baptiste, when a bug occurs, to know from
which version they were upgrading. Installing the update silently would have
hidden all that info. We decided to display a prompt asking users if they wanted
to install the update now or later.

The app itself is something you use many times a day, but you rarely spend more
than a few seconds in it. You display it, you type what you look for, you find
it, click it and it opens a new tab to your result. Once a result is selected,
the app disappears. It means that most of the time, if there was an update, it
didn't had time to finish downloading that you were already doing something
else.

Prompting the user "Do you want to install the new version" while they were
doing something different was too intrusive. We decided that if the app was not
currently focused when the download was over, we would just not show the prompt,
and simply keep the update for next time.

Next time you open the app, if an update was pending, we will prompt to install
it. Once again, if the user clicked "Later", it will just ask again next time.

To conclude, Baptiste also added a manual "Check for updates" button. Electron
apps really look like desktop apps, and our expections as users are not the same
when we use a desktop app or a website. With apps, we want to feel we are in
control. It's something we installed on our machine, so we should be able to
tell it when to update if we want to. This button was not doing much more than
requesting a check for update when it's clicked instead of waiting 5 more
minutes, but it gave the users the feeling that they are in control.

To conclude, keep in mind that the technical part is usually the fastest. Making
sure the workflow is enjoyable to your users is the hardest part. People have
different expectation in desktop apps than in website. Because it's the same
code for you does not mean it will be the same experience for your users.

## GitScout

Second talk was about GitScout, a MacOS app to handle GitHub issues. I was
surprised at first that an Electron app was advertised as a "MacOS App", because
Electron is supposed to be used on any platform.

I understood why they want that way. They went to great lengths to have
the same kind of UX in their app as you could have on a native Mac OS app. The
main example they gave is about the popover notifications you can have in
a native MacOS app. 

Those popovers can float partly "outside" of their main window. This is not
possible in an Electron app, as an app must live inside a window, and you cannot
make it go outside of it. To solve that, they created two windows. The parent
one is the main app, and it has a child one, invisible by default. Then when
it's time to display the popover, they will position the child window, make it
visible and style it to look like a popover.

The issue with that approach is that the second window then takes the focus,
which put the first window as inactive and all the OS-level styling of inactive
window will take place. They then had to remove the OS-level handling of the
window and redo it all themselves, so they can adjust it as needed. In the same
vein, they had to deal with the clicks through the child window that should be
forwarded to the underlying window.

They did a good job reimplementing the native behavior and handled many
edge cases of the popover positioning. It took them about 4-5 days which would
have been less more than learning to code directly in native so I'd say it's
worth it... until the next MacOS update breaks everything.

## Cross-platform app in electron

Then Aircall did a presentation about the building of cross-platforms apps in
Electron. The main tool to use is electron-build, which will help you package
your build for each platform.

Any platform can be built from any platform (using `wine` or `mono`), as long as
you are not using any native C/C++ APIs. Also note that even if the code you
write is supposed to work the same on every platform, you still have to
sometimes handles the specificities of each (in which case, `process.platform`
is your friends). Apparently, there are also some Electron-specific differences
between platform, so the best way to debug is to have 3 machines, one for each
platform.

All the build info of `electron-build` is taken from your `package.json`. You
can define, for each platform, the specific setting you want to pass to your
build. Also note that by default, only the files that you explicitly `require`
will be included. If you need to pass any other file, you'll have to pass them
manually in the config.

To release your app, you can either use Nuts like Baptiste talked about in the
first talk, or use electron-release-server that you'll have to host but which
will give much more power on the auth and release channels (beta, dev,
prod, etc).

## Audio in Electron

Last talk was also by Aircall, but about the sound APIs. Sound in Electron is
nothing more than what you can do with sound in Chrome. The Chrome
version being set in an Electron app, you know what will be available
and what will not. Furthermore, you can pass specific `flags` to Chrome to
enable some features.

The demo was about listing all the input and output devices of the computer,
firing events when a new one was added, and then capturing the input stream of
one, to send it to the output stream of another.

Aircall uses this (and then send it through WebRTC) to make calls between two
peers, which is pretty clever. Having control over the environment and being
able to build sound-oriented apps in Electron is interesting and I'm sure this
opens the road to interesting applications. I'll have to give it a try.

## Conclusion

I'm glad I came. I didn't know there was such a big Electron community in
Paris (I would say we were around 60), and having that many interesting talks
was worth it.
