Last week we hosted our React themed Search Party at Algolia. Search Party is
a monthly meetup we organize where we talk about all things related to search,
around a common theme. This time we talked about React, and everything you can
do with it.

## Codesandbox: your IDE in your browser

Ives Van Hoorne flew firectly from the Netherlands to expose his work on
Codesandbox. The idea for Codesandbox came to him when he was trying to help
some friends on code, but they had no easy way to share their projects. At first
they would talk about their code and mentally parse and run it in their head.
This was error-prone, so Ives decided to work on a better collaboration tool.

He started building his own online editor. At that moment in the talk, Ives
asked the audience who already knew about Codesandbox and half the room raised
their hands. That was a pretty cool moment.

Codesandbox UI is a split view. On one side you have your code, and on the other
you have a live preview of the code. Whenever you update the code, the preview
automatically reloads. The nice thing about this view is that you can load full
project, and require any `npm` dependency and run them directly in the browser.

Technically, Codesandbox is written in React and is made of two different apps.
One is for handling the code editor, the other is for running the preview. Both
apps are running on different subdomains so a live preview cannot hijack your
Codesandbox credentials.

Whenever code is updated in the editor, Codesandbox will compile/transpile it
and send it to the live preview for execution. Any error generated are then sent
back and displayed in a more human-friendly way.

This human-friendly aspect is very important in Codesandbox. As Ives put it:
humans will be reading the code and humans are visually focused. We better
understand images than code, so a clear UI can go a long way compared to code.
The way Codesandbox is trying to improve the Developer Experience is through the
UI. If something can be done easily through the UI, this is where it should be.

One example of such a UI is the webpack dashboard included in Codesandbox, that
gives you a clear visual representations of your bundles and their respective
sizes. Another example is the way error messages are displayed. Codesandbox goes
further than only displaying what the error is; it also explains what went wrong
and how to fix it. For simple errors like a missing dependency, it even
provides a one-click button to add the dependency.

Algolia plays an important role in that quest to the best DX, as it provides the
search into all the `npm` packages. The index we built and maintain for Yarn is
available for anyone to use. Codesandbox uses it for discovery of packages as
well as autocomplete when adding a `require`. As Ives himself said: "I've seen
search. Algolia is not search, it's instant results". Because of that speed,
Algolia can be used directly in the UI. Where Ives imagined he would need about
7 days of work, it took him only 1 day to have it ready.

Ives finished his talk with more ideas about how he could use Algolia to improve
the DX of Codesandbox even further. His first one would be to re-use the indices
of DocSearch to provide contextual documentation help directly from the editor.
This would remove one more steps for users and allow them to stay in the zone
for longer. Another idea would be to improve the error display by automatically
searching for the error and displaying the documentation about it. Both are very
good ideas, and we're going to work with Ives to see how we can make them
happen!

Thanks to Ives for coming to the event, it was a very motivating talk that gave
us a lot of new ideas. Ives is the perfect example of "the guy that didn't know
it was impossible, so he did it".

## Search UX on Native

Second talk was our very own Marie that explained the UX challenges of building
a search interface for mobile, and how our InstantSearch library can help solve
them.

There are two main ways to do search on mobilep, which mostly differ based on
the type of content you have. 

If your users absolutely need the search to find what they are looking for (like
on Amazon for example), then you need to have the search as a central part of
the UI, available on every single page. This will be their main entry point to
find content.

On the other end, if your users don't yet know what they are looking for, you
can give them suggestions to browse (like Spotify songs, playlist and artists
for example) and only have search as a dedicated tab, for a different browsing
experience.

Whatever option you chose, the golden rule is that your should never start
a search with no results displayed. Displaying results even before typing
something gives a clear guidance to your users what they can search into. You
can add the most popular results, or results from previous searches for example.

Another mandatory feature is to have the search react instantly to what users
are typing. Forget about the "Submit" button, don't force your users to type
complete words when you could display results from the first keystroke.  There
are two possible behaviors here: you could either display a list of search
suggestion in a dropdown menu, or directly display the results. Once again, this
will depend on your type of results. If you have a large catalog of items in
different categories (like Amazon does), it might be more interesting to display
search suggestions, to help your users navigate. Otherwise, it might be better
to display the first relevant results as soon as users are starting typing.
Pinterest even combine both behaviors, they display both search suggestions and
actual results in a dropdown.

Once your users are seeings results, it is important to help them go back to the
search, to refine their results. Ideally, you should add a back button, but also
display the current search query and its potential filters. Adding a "Sort"
button could also help them better rank the results.

Mobile search is different than desktop search for two main reasons: the screen
size, and the connection speed. Because the size real-estate is so scarce, you
have to define if you want to display results in a visually driven way, or in
a specs driven way. When going for visuals, you display large pictures of your
results, so users can scan them based on how they look (great if you're selling
shoes for example). For spec driven, you can use a smaller image but add more
detailed information about each results (like the distance and number of stars
for a list of restaurants for example).

Real estate also become an issue when users have to type their query, as typing
on a virtual keyboard is harder than typing on a regular one. Small size screen
and large fingers often lead to typos. Your search engine should be able to
handle them and still find relevant results. Highlight in the results
should help your users understand why a certain result is displayed, even if
mistyped.

As for speed, we have to assume that users will have a low connectivity, with
regular drops when they'll be moving into a zone with weak or no connection.
Your search page should have a progress indicator to let your users know that
they are waiting for results. Ideally, a first version of the results, in low
fidelity format, could be rendered before the full version is displayed.

After listing all those small things you have to be wary of when designing
a mobile search UX, Marie went on showing what InstantSearch was. InstantSearch
is basically our solution to those problems. It packages a set of UI components
on top of the Algolia API, that include all the best practices explained above.
All those components are open-source and extensible, letting you add your own
custom logic and customize them.

She ended her talk with a live demo of implementing a mobile search using our
React-flavored version of InstantSearch. Step by step, from the searchbar to the
results, including the highlight. In less than 5mn, she had a search working.
Yay InstantSearch!

## Let's recode Redux in 15mn

The last talk of the night was by Aurore Malherbes, a mobile developer
specialized in React Native. Her talk had nothing to do with React Native
though, as she instead presented an exercise she does with any new member
joining her team: recoding Redux from scratch to understand how it works.

As a disclaimer, most of her talk is based on the course done by Dan Abramov on
egghead.io about Redux (https://egghead.io/courses/getting-started-with-redux).
Redux itself is not hard, but to use it correctly one needs to actually
understand it and the best way to understand it is to build it.

