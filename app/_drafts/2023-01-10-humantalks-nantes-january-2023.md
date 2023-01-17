
Sercel around Nantes, Carquefou. Does sismis stuff, but very hardware and
factory oriented. Have trouble hiring.

Because they went to DevFest several times to learn, they thought that they
should also be sponsors.

They created a game to attract people  on the stand
 
they build sensor stuff to detect vibration or inclinasion, as well as sound in
water (to detect whales)

use a python library called VGamePad to transform input into gamepad inputs, so
they could plug it to games

use an easy game on edge://surf

built a surf board, reinforced, and stabilized with tennis balls, hand made

did a test phase in their break room during one month to detect bugs

problem: they use GPS as time factor, but doesn't work inside buildings
need specific calibration because because highly sensible, but surf board is too
high
also need to make it update more frequently than the default 1s

update game to make it easier: boost by default, more life, auto-start, from
back to top, instead of top to bottom

? Baleines?
? Vous avez recruté depuis le devfes


# Contextual Product Management

William Bartlett
@bartlettstarman

Industry a bit black & white. Either that or this. Always do agility or always
do command and control. Scrum Vs Kanabna. Estimate or No Estimate. You need
a vision or you're lost.

Building, Fast and Slow
Making sens of the contexte, adapt to the contexte, scaling.

Make sens of the context
primo-adoptant, majorité précocé, majorité tardive, garde
motivated by how, then why, then becaue of the other, and finally forced

primo adoptant, only want o build with shiny tech and be the one that build it
then, majorité précoce, don't care how t works, just want it to work
Based on "Crossing the chasm"

Then, don't care, don't think. Buy it because Microsoft or Google does it, or
because McKinsye said it was good
The guard is about being forced, didn't even had a say in it

Exemple. IBM, then Microsoft. IBM was full hardware, IBM didn't saw it, but
software was better so Microsft. But Microsoft didn't see that brand is
important and lose to Apple. They want something easy and beautiful, people
don't want to talk abour their OS, it has to be transparent

To initiate an innovation, don't use Scrum or MVP, Lean Startup, Disign Thinkinh

If you do something new, do it at a scale where you can go over failure
Nothing is more dangerous than an idea, when you only have one idea.
Create serendipity

But do: parallel exploration, prétotypage/prototypage. Exaptation, not
adaptation. Use the same tool but to do something different, opposite that
adaptation.

To scale: Scrum is good, as is extreme programming and shape up.
Optimise: Lean, Kanban
Fin de vie: Six Sigma, Waterfall for end of life. Is for end of line, even if
will last for decades


Scale and resilience. 
Still talk about Spotify and Netlix because it's more than streamin audio and
video.
Move things on the right, use commodities instead of custom built


? Why Microosft => Apple
? Sérendipité
? Prétotypage
? Exaptation
? Cartographie, you don't know the component at the first stages



# Dessiné c'est gagné

Pierre Tibule
CTO Ikobox?
Help cemicro-entrepreneut, put them in touch with people to help them
Co-organizer Android Nantes, Camping des Speakers

Pro life, always have a pen in hand. 
A picture is worth a thousand word. Explain things with schemas instead of words
try to translate functional explanatin in drawing, allows to speak a common
language

used it to explain filter, map et reduce with drawings
Much easier

# HTML for forms

Gael Poupard. HTML, CSS, JS, SVG.
ffoodd.fr/human-talks/

Full HTML slides
How can HTML improve UX, and a11y.

With `type="email"` it pops a keyboard on mobile with the `@`. 
Put `autocorrect="off"` and `autocapitalize="off"` also for emails, as you don't
need them.
`autocomplete="email"` allows to suggest specifically emails. This is required
in a11y, this is UX to improve life of everyone.
Also available for addresses, payment card, etc. There is a standard and norms
for that.
Can even suggest the suggestions with `<datalist id="email-5"><option
value=""></datalist>`, link with the `list` attribute on the input.
Different from a select, it's a suggestion, but you can add more. 

Nice for `type="color"`, with a sublist of available colors.

`spellcheck="false"`. There is no HTML spec for spellcheck, and each browser
send spellcheck to servers. Bad for ecology, also bad for security.


