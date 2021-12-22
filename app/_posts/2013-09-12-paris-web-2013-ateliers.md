---
layout: post
title: Paris Web 2013
---

## Introduction

Le samedi, après les conférences Paris Web, c'est toujours les ateliers. Je
conseille à tout le monde d'aller aux ateliers. Même si vous ne venez pas aux
conférences, les ateliers sont toujours très instructifs et surtout, c'est
vraiment pas cher.

Ce sont des cours moins théoriques et plus pratiques, par petits groupes, et
avec une plus forte intéraction avec le speaker.

## Apprendre à se servir des Chrome Dev Tools

Thomas Bassetto nous parle des fuites mémoires et de comment on peut les
débusquer et les corriger avec les Chrome Dev Tools. Le principe même d'une
fuite mémoire, c'est qu'elle n'apparait pas dès le début mais seulement quand
on laisse tourner son application pendant un certain temps d'utilisation.

A la fois Chrome Canary et les Nightlies de Firefox proposent des outils de
profiling très utiles pour les trouver. Les versions ne sont pas toujours
stables, mais elles sont excellent pour débugguer.

Pour Chrome, il est conseillé de se créer un nouveau profil pour débugguer.
Pour repartir comme ça sur une base clean, sans extensions, sans cache, sans
historique, etc. Idem sous Firefox.

Safari sous Mac a longtemps était une copie-conforme de Chrome, mais
aujourd'hui les deux sont bien différents et les outils de débugging de Safari
sont très mauvais. À la place, il est conseillé sous Mac d'utliser WebKit.app.

Sous Windows 8.1, les outils de debug de IE11 sont très bon aussi. Si vous
devez débugguer d'anciennes versions de IE, c'est une autre histoire...

Thomas nous présente ensuite quelques raccourcis bien utiles et pas forcément
connus de l'outil. En sélectionnant un nœud et en appuyant sur `h`, on le
masque, `suppr` le supprime du DOM (et on peut l'annuler avec `Ctrl-Z`). Il est
aussi possible de déplacer des nœuds du DOM simplement en faisant un
drag'n'drop.

Dans la colonne de droite, on peut aussi forcer les états `:hover`, `:active`
et `:focus`. Il est possible d'incrémenter les unités CSS en appuyant sur
Haut/Bas (en ajoutant `Ctrl` ou `Maj` on augmente aussi l'incrément).

Il nous a aussi parlé des fonctions avancées de logging comme `console.group`,
`console.groupEnd`, `console.time` et `console.timeEnd`. Malheureusement, je ne
me souviens plus ce qu'elles font...

Il existe de plus des tas d'extensions pour Chrome et Firefox qui ajoutent des
fonctionnalités spécifiques pour certains frameworks, comme Ember, Angular,
Knockout ou Backbone.

Avec les Chrome Workspaces, on peut même en partie remplacer son IDE. Il est
possible de modifier le CSS directement depuis le browser, puis de voir les
fichiers modifiés, avec le diff par rapport aux fichiers source. Chrome est
même capable d'exporter les fichiers ainsi modifiés pour remplacer les fichiers
existants. Ca ne marche par contre pas encore avec les préprocesseurs.

Ces outils proposent plein de petites choses pour rendre la vie du développeur
plus facile. Ils ont des fonctionnalités de prettyprint du code (pour indenter
correctement un fichier minifié par exemple). Parfois, ces options sont un peu
cachées, mais elles existent. Ils proposent aussi bien souvent l'objet `$` qui
permet de faire des sélections CSS à la jQuery. Si jQuery est chargé alors il
l'utilise, sinon il se rabat sur les méthodes natives.

Thomas nous a aussi montré des trucs plus puissants comme des breakpoints en
CSS pour voir quand une propriété est modifiée, et par qui (feuille de style,
script ?). Je ne me souviens plus de la manip, mais ça m'avait bluffé.

Finalement la dernière feature intéressante sont les possibilités de timeline.
On peut voir en temps réel les reflow et les repaints. Ca permet de voir où
l'affichage de l'UI prends du temps. A savoir que chaque browser possède ses
propres routines pour l'affichage et que donc Firefox et Chrome ne ralentiront
pas forcément sur les mêmes choses.

Il est possible de voir le fps général, et donc de détecter ce qui le fait
baisser (peut-être un évenement un peu trop poussif bindé sur un `onscroll` ?).
Il est possible de zoomer sur un moment de la timeline en le selectionnant pour
aller voir plus profondément, et à partir de là remonter les stacktrace pour
voir ce qui a appellé les redraw.

L'outil est vraiment super puissant et je ne me doutais pas qu'il permettait
autant. Il est par contre assez complexe à prendre en main, car les
fonctionnalités sont légions et parfois cachées.

Thomas a finalement terminé en nous donnant quelques astuces qu'il a apprise au
fil de ses débugs. Déjà, le trick d'utiliser `-webkit-transform:translateZ(0)`
sur une animation permet de la faire traiter par le gpu plutot que le cpu.
Utiliser un `background-fixed` sur le body permet d'économiser des repaints.
Désactiver les effets de survol quand on scroll est aussi une très bonne idée.
Pour ça on peut ajouter par défaut une classe sur le body, qu'on supprime quand
on scroll et on n'active les effets `:hover` que si cette classe est présente.

Finalement il nous a montré les Heap Snapshot de Chrome qui permettent de
prendre un snapshot de la mémoire à un moment donné. Vu que ça prends
absolument tout en compte il est parfois difficile d'y trouver ce qu'on
cherche. Son astuce est de prendre un premier snapshot, puis de faire X fois la
même action, qu'il suppose être la cause du problème, puis de reprendre un
autre snapshot. Puis il compare les deux, et regarde dans le diffs ceux qui
sont multiples de X. Par entropie il a trouvé que `X = 7` était un bon chiffre,
qui est assez grand pour sortir du lot et assez petit pour ne pas prendre trop
de temps. Et surtout, c'est un nombre premier, donc on a moins de faux
positifs.

Et bien sur, ses slides sont [dispos online](http://bit.ly/pwdevtools).

## Enrichissons nos frameworks web

Raphaël Goetter et Nicolas Hoffman nous parlent de frameworks CSS, en prenant
comme exemples leurs propres créations. Ils n'étaient pas là pour vendre leur
solutions. Ils étaient plutot là pour donner leur retour d'experience, pour
qu'on puisse en profiter quand on fait nous-même nos frameworks.

Alors bien sur, on ne fait pas tous des frameworks CSS open-source que d'autres
vont utiliser, mais on possède au moins un tas de classes qu'on réutilise d'un
projet à un autre. POur faciler la réutilisation, il y a donc quelques bonnes
pratiques à prendre en compte.

Déjà, découper ses classes pour les rendre le plus réutilisables possibles.
Utiliser une nomenclature cohérente pour nommes les éléments d'interfaces.
Toujours garder ses fallbacks pour vieux browsers proches du code de la feature
initiale (pas dans une feuille de style supplémentaire). Utiliser `normalize`
pour être sur de partir sur la même base à chaque fois.

Et surtout, une fois que votre nomenclature de nommage est statuée et
cohérente, documentez-la et expliquez-là, donnez des exemples.

Il est parfois nécessaire d'aller à l'encontre des bonnes pratiques, comme
d'utiliser le sélecteur universel `*` pour remettre un box-model par défaut, ou
utiliser `!important` pour être sur de ne pas avoir une règle fondamentale
écrasée. Bon, là on a le droit, c'est pas une rustine pour un cas particulier.

Finalement comme autres frameworks CSS, ils conseillent de tester Zurb
Foundation.

## Monitoring

Dernière conférence de la journée et absolument passionante. On a eu un retour
d'expérience d'un ops du journal 20 minutes (à moins que ce ne soit Metro ? Je
ne me souviens plus).

Il commence par nous dire qu'il est inutile de tout monitorer. Quand on tracke
trop d'indicateurs et qu'on se mets trop d'alertes, on recoit plein d'emails et
on finit par ne plus les lire et faire des règles de filtrage pour simplement
les marquer comme lus.

De la même façon, il faut éviter de créer des dashboards avec des tas de
valeurs affichées partout. Le cerveau humain ne process pas cette info aussi
vite que si on avait simplement affiché des couleurs, pour voir d'un coup d'œil
ce qui cloche.

Il nous a ensuite parlé des outils. Tout d'abord `collectd` qui collecte des
tas d'infos sur le serveur où il tourne (process, RAM, hard drive, etc) et qui
les envoie ensuite quelque part.

De l'autre coté, on a Graphite dont le job est d'afficher des données sous
forme de graph. Il peut s'installer chez soi ou s'utiliser en SaaS avec
Librato. Graphite ne contient pas d'intelligence, il prends des données dans le
temps, sous forme de flux, les map et les reduce, garde un historique et les
affiche. Les infos ne sont pas stockées telles qu'elles, elles sont compressées
au fil du temps pour ne garder qu'un trend.

Graphite fonctionne sous forme de fenetres de temps (Jour, Heure, minutes, etc)
sur lesquelles on génére des statistiques génériques. Seuls des valeurs
numériques simples peuvent être sauvegardées. Le but est de voir l'évolution
d'un "compteur" au fil du temps sur des fenetres plus ou moins grandes. Par
défaut pour passer d'une fenetre de temps à une autre Graphite fait une
moyenne, mais on peut le configurer pour faire un min, max ou une somme.

Tout ceci est exposé sous forme d'url pour obtenir les valeurs depuis
l'exterieur.

Un autre outil à ajouter à sa ceinture est `statsd` qui permet de collecter des
metrics plus personnalisés, applicatives. Cet outil prends des valeurs sous
forme de jauge (% de RAM utilisé, jauge de vitesse, etc). Les metrics sont
à prendre directement dans le code de l'application, et il existe des SDK pour
à peu près tous les langages. L'idée c'est bien sur de lui faire ensuite
envoyer ses informations à Graphite pour les tracker.

Graphite n'est pas très performant en cas d'envoie de beaucoup de données. Il
est donc possible que des datas soient envoyées, mais ne soient jamais recues.
Dans ce cas, on peut faire comme Etsy qui utilise du sampling. C'est à dire
qu'ils n'envoient pas toutes leurs données, mais seulement un sur 10, et ils
extrapolent ensuite dans Graphite.

Il semble aussi possible d'envoyer des données vers Graphite à partir de
`munin` et `awstat` mais notre speaker ne l'a pas testé directement.

Ensuite vient logstash, un outil basé sur elasticsearch qui permet de
recueillir les logs et les étudier. La bonne pratique est déjà de centraliser
ses logs sur un même serveyr, ne pas les laisser pourir les serveurs sur
lesquels ils sont créés. Surtout quand on scale, on détruit beaucoup de
machines et on risque donc de perdre des logs. Pour ça, on peut utiliser
`syslogrc` ou `checksyslog`.

Logstash permet de faire des requetes sous forme de regexp, ou de filtrer sur
certaines url (pour savoir le nombre de connections à un panier d'achat par
exemple). Pour peu que les urls du site soient bien ordonnées, ça permet de
faire du tracking à peu de frais en utilisant les logs déjà générés par le
serveur.

Un marqueur important à garder dans graphite est les dates des déploiement, de
manière à les correler avec les pics possibles d'erreurs et de pouvoir ainsi
facilement les isoler. Idéalement chaque commit devrait être présent sur la
timeline. Il est important d'avoir des métriques visuelles rapides dès qu'on
déploie, pour voir si on a pété quelque chose en production. En intégration ça
permet aussi de pouvoir comparer les stats d'un commit sur un autre.

Il nous a aussi parlé de `ab` ou de `thung` (pas sur de l'orthographe) qui sont
des outils pour tester un serveur, voir à quand il va s'effondrer. Descartes
est un dashboard avec un peu plus de classe que le theme de base, pour
Graphite.

La fin du talk était surtout l'occasion de lancer quelques noms d'apps qui
peuvent aussi aider dans le monitoring, comme `logly`, `logentries`,
`papertrails` ou `spunk` pour l'analyse de logs. `sentry` pour les logs front,
capturer les exceptions, observer les valauers des variables. Il est nécessaire
de le configurer abondamment pour l'utiliser en prod car lui demander de
logguer toutes les erreurs risque d'en faire beaucoup trop.

Dans la veine de nagios, il nous conseillait [riemann](http://riemann.io/) ou
[sensu](http://sensuapp.org/).
