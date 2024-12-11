# meetups.pixelastic.com

This repo holds the sources of the
[http://meetups.pixelastic.com](http://meetups.pixelastic.com) website.

It contains recaps of various meetups and conferences I attended. There are
a lot of recaps from around 2009, but then less and less of them. I still add
some here once in a while.

## Notes from 2024

We're in September 2024 and I need to make this old website run again. Many of
the languages have seen major updates (several of them) and some tools do not
even exist anymore. Below are some rough notes of what I did to make it somehow
work a bit.

- Install ruby deps with `bundle install`
- Create `_algolia_api_key` file, it's required
- Run `yarn install`
- Cross your fingers
- Run `yarn run build`


`yarn global add -- grunt-cli bower`

## Installing Bundle dependencies

`bundle install`

After 4+ years not touching this repo, the above command failed because it
couldn't install the `json` dependency. I had to do a mix of the following
commands, hope it will help you too:

- `bundle update json` (to update from 1.8.3 to 1.8.6)
- `bundle update yajl-ruby` (to update from 1.2.1 to 1.2.3)

## Installing bower dependencies

`bower install`

## Installing node dependencies

`yarn install`

