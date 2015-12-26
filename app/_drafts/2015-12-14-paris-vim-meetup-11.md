---
layout: post
title: "Paris Vim Meetup #11"
tags: vim
---

I went to the 11th Paris Vim Meetup last week. As usual, it took place at
Mediabox (near Place de Clichy), and we were a small group of about 10 people.

Thomas started by giving us a talk about vimscript, then I talked about
Syntastic. And finally, we all discussed vim and plugins, and common issues and
how to fix them.

## Do you really need a plugin?

This talk by Thomas was a way to explain what's involved in the writing of a vim
plugin. It covers the vimscript aspect and all its quirks and was a really nice
introduction for anyone wanting to jump in. Both Thomas and I learned vimscript
from the awesome work of [Steve Losh][1] and its [Learn Vimscript the Hard
Way][2] online book.

Before jumping into making your own plugin, there are a few questions you should
ask yourself. 

Isn't this feature already part of vim? Vim is such a huge piece of software
that it is filled with features that you might not know. Do a quick Google
search or skim through the `:h` to check if this isn't already included.

Isn't there already a plugin for that? Vim has a huge ecosystem of plugins, of
varying quality. Check the [GitHub mirror of vim-scripts.org][3] for an easy to clone
list.

And finally, ask yourself if your plugin is really useful. Don't forget that you
can call any commandline tool from Vim, so maybe you do not have to code a whole
plugin if an existing tool already does the job. I like to quote this [vim
koan][4] on this subject:

> A Markdown acolyte came to Master Wq to demonstrate his Vim plugin.
>
> "See, master," he said, "I have nearly finished the Vim macros that translate
> Markdown into HTML. My functions interweave, my parser is a paragon of
> efficiency, and the results nearly flawless. I daresay I have mastered
> Vimscript, and my work will validate Vim as a modern editor for the
> enlightened developer! Have I done rightly?"
> 
> Master Wq read the acolyte-s code for several minutes without saying anything.
> Then he opened a Markdown document, and typed:
> 
> `:%!markdown`
>
> HTML filled the buffer instantly. The acolyte began to cry.

## Anybody can make a plugin

Once you know you need your plugin, it's time to start, and it's really easy.
[@bling][5], the author of [vim-bufferline][6] and [vim-airline][7], two popular
plugins, didn't known how to write vimscript before starting writing those two.
Everybody has to start somewhere, so you'd better start writing something that
you need and will use.

A vim plugin can add almost any new feature to vim. It can be new motions or
text objects, or even a wrapper on an existing commandline tool or even some
syntax highlight.

The vimscript language is a bit special. I like to say that if you've ever had
to write something in bash and did not like it, you will not like Vimscript
either. There are initiatives, like [underscore.vim][8], to bring a bit more sanity
to it, but it is still hackish anyway.

## Vimscript basics

First thing first, the variables. You assign variables in vimscript with `let
a = 'foo';`. If you ever want to change the value of `a`, you'll have to
re-assign it, and using the `let`  keyword again.

You add branching with `if` and `endif` and loops with `for i in []` and
`endfor`. Strings are concatenated using the `.` operator and list elements can
be accessed through their index (it even understand ranges and negative
indices). You can also use Dictionaries, that are a bit like hashes, where each
key is named (but will be forced to a string, no matter what).

You can define functions with the `function` keyword, but vim will scream if you
try to redefine a function that already existed. To suppress the warning, just
use `function!`, with a final exclamation mark. This is really useful when
developping and sourcing the same file over and over again.

Variables in vimscript are scoped, and the scope is defined in the variable
name. `a:foo` accesses the `foo` *a*rgument, while `b:foo` accesses the *b*uffer
variable `foo`. You also have `w:` for *w*indow and `g:` for *g*lobal.

## WTF Vimscript

And after all this basics, we start to enter the _what the fuck_ territory.

If you try to concatenate strings with `+` instead of `.` (maybe because you're
used to code in JavaScript), things will kind of work. `+` will actually force
the variables to become integers. But in Vimscript, if a string starts with an
integer, it will be casts as this integer. `123foo` will become `123`. While if
it does not, it will simply be casts as `0`. `foo` will become `0`.

This can get tricky really quickly, for example if you want to react to the word
under the cursor and do something only if it is an integer. You'll have a lot of
false positives that you do not expect.

Another WTF‽ is that the equality operator `==` is actually dependent on the
user `ignorecase` setting. If you `:set ignorecase`, then `"foo" == "FOO"` will
be `true`, while it will stay `false` if the option is not set. Having default
equality operators being dependent on the user configuration is... fucked up.
Fortunatly, Vimscript also have the `==#` operators that is always
case-insensitive, so that's the one you should ALWAYS use.

## Directory structure

Most Vim plugin packagers (Bundle, Vundle and Pathogen) expect you, as a plugin
writer, to put your files in specific directories based on what they do. Most of
this structure is actually taken from the vim structure itself.

`ftdetects` will hold the code that is used to assign a specific `filetype` to
files based on their name. `ftplugin` contains all the specific configuration to
apply to a file based on its `filetype` (so those two usually works together).

For all the vim plugin writers out there, Thomas suggested using
`tpope/scriptease` that provides a lot of debug tools.

## Tips and tricks

Something you often see in plugin code is the `execute "normal! XXXXX"`.
`execute` lets you pass an argument that is the command to execute, as a string.
This allows you to build the string yourself from variables. The `normal!` tells
vim to execute to following set of keys just like if the user is in normal mode.
The `!` at the end of normal is mandatory to override the user mappings. With
everything wrapped in a `execute` you can even use special chars like `<CR>` to
act as an Enter press.

# Syntastic

After Thomas talk, I briefly talked about Syntastic, the syntax checker for vim.

I use syntasic a lot with various linters. Linters are commandline tools that
analyze your code and output possible errors. The most basic ones only check for
syntax correctness, but some can even warn you about unused variables,
deprecated methods or even style violation (like camelCase vs snake_case
naming).

I use linters a lot in my workflow, and every code I push goes through a linter
on our Continuous Integration platform (TravisCI). Travis is awesome, but it is
asynchronous, meaning I will receive an email a few minutes after my push if the
build fails. And this kills my flow.

This is where syntastic comes in play. Syntastic lets you add instant linter
feedback while you're in vim. The way I have it configured is to run the
specified linters on the file I'm working whenever I save that file. If errors
are found, they are displayed on screen, on the lines that contains the error,
along with a small text message telling me what I did wrong.

It is then just a matter of fixing the issues until they all disappear. Because
the feedback loop is so quick, I found it extremely useful when learning new
languages. I recently started a project in python and I never used it before.
First thing I did was install `pylint` and configure syntastic for it. Everytime
I saved my file, it was like having a personnal teacher telling me what I did
wrong, warning me about deprecated methods and teaching me the best practices
from the get go.

I really recommend adding a linter to your workflow as soon as possible.
A linter is not something you add once you know the language, but something you
use to learn the language.

Syntastic has support for more than a hundred language, so there's a great
chance that yours is listed. Even if your language is not in the list, it is
really easy to add a Syntastic wrapper to an existing linter. Without knowing
much to Vimscript myself, I added 4 of them (Recess, Flog, Stylelint,
Dockerfile_lint). All you need is a commandline linter that outputs the errors
in a parsable format (json is preferred, but any text output could work).

# Conclusion

After those two talks, we all gathered together to discuss vim in a more
friendly way, exchanging tips and plugins. Thanks again to Mediabox for hosting
us, this meetup is a nice place to discover vim, whatever your experience with
it.


[1]: http://stevelosh.com/
[2]: http://learnvimscriptthehardway.stevelosh.com/
[3]: https://github.com/vim-scripts?tab=repositories
[4]: http://blog.sanctum.geek.nz/vim-koans/
[5]: https://twitter.com/bling
[6]: https://github.com/bling/vim-bufferline
[7]: https://github.com/bling/vim-airline
[8]: https://github.com/haya14busa/underscore.vim
