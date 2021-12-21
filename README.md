# meetups.pixelastic.com

Voici les sources du site accessible sur [http://meetups.pixelastic.com](http://meetups.pixelastic.com).
Vous y trouverez les compte-rendus des différents meetups et conférences
auxquels je participe.

Les compte-rendus sont écrit en markdown et le site est généré avec
[Jekyll](http://jekyllrb.com/). Le thème vient de [Hyde](http://andhyde.com/).

# Installation

## Installing Yarn dependencies

`yarn install`

## Installing Bundle dependencies

`bundle install`

After 4+ years not touching this repo, the above command failed because it
couldn't install the `json` dependency. I had to do a mix of the following
commands, hope it will help you too:

- `bundle update json` (to update from 1.8.3 to 1.8.6)
- `bundle update yajl-ruby` (to update from 1.2.1 to 1.2.3)


