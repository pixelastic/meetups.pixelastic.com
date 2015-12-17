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



`==` depends des settings de l'utilisateur, du coup `==#` case-insensitive

Bundle/Pathogen/Vundle propose une structure directory pour mettre ses codes

ftdetect pour définir les `ft`
ftplugin pour loader en fonction dufiletype
`plugin#funcName()` dans `autoload`, method autoloadé seulement quand on l'appelle la première
fois, puis garde en cache


tpope/scriptease => outils de debug

`execute "normal! gg/foo<CR>"`
force a passer en mode normal pour utiliser les commandes normales. avec un `!`
pour bypasser les mappings du users
wrappé dans `execute` pour pouvoir taper réellement Enter avec <CR>


settings par défaut
```vim
check if !exists('g:pouet')
  let g:pouet = 'default'
endif
```


example de learn vimsvrit the hard way pour définir un nouvel opérateur
genre grep la selection
fnuction `s:funcname`, utilise avec `<SID>` ensuite
@@ => unnamed register



ternJS pour completion JS
compilation à la main, puis devrait ùarcher avec les require
YouCompleteMe, script à lancer
exuberantCTags?
UltiSnips autocompletion? + YouCompleteMe
SuperTab?


[1]: http://stevelosh.com/
[2]: http://learnvimscriptthehardway.stevelosh.com/
[3]: https://github.com/vim-scripts?tab=repositories
[4]: http://blog.sanctum.geek.nz/vim-koans/
[5]: https://twitter.com/bling
[6]: https://github.com/bling/vim-bufferline
[7]: https://github.com/bling/vim-airline
[8]: https://github.com/haya14busa/underscore.vim
