---
layout: post
title: "HumanTalks Mai 2015"
tags: humantalks
---

Ce mois-ci, les HumanTalks étaient chez [Deezer][1], dans leur belle grande
salle du rez-de-chaussée. Un beau frigo rempli nous fait de l'œil, le buffet va
être bien, Deezer a tout prévu.

La soirée s'est plutôt bien passée, malgré les quelques fails. Déjà, un des
speakers n'est pas venu, alors qu'il avait confirmé encore la veille et n'a pas
jugé utile de prévenir. L'un des trois autres speakers l'a alors remplacé au
pied levé, mais sa présentation, trop commerciale, n'était pas très
convaincante. 

Du coup, toutes nos pizzas sont aussi arrivées avec un peu de retard et il
a fallu attendre un peu avant de pouvoir manger. Le tout dans une salle bas de
plafond, avec une clim qui marche mal. Oh, et on a eu le rétroprojecteur qui
s'est mis à faire grève durant l'introduction aussi. Mais sisi, je vous assure,
c'était bien.

## Github Awards, découvrez votre ranking

{% youtube https://www.youtube.com/watch?v=vrxW9ae-7UE %}

[Vincent Daubry][2], co-fondateur de [Yooboox][3] et développer Ruby/iOS nous
parle d'un [petit side project][4] qu'il a récemment mis au point et qui a assez
fait parler de lui.

Il avait vu il y a quelques temps une [présentation][5] de [Sacha][6], qui
parlait des side-projects, et que ceux-ci devaient rester simples, prendre peu
de temps et surtout être fun.

Du coup, de son coté il s'est donné 2 semaines, en bossant le soir et le
week-end pour terminer son projet. 2 semaines c'est assez long pour pouvoir
construire quelque chose, et assez court pour ne pas se lasser.

Son projet, nommé [GitHub Awards][7] permet de "noter" les différentes personnes
inscrites sur GitHub pour voir qui est le plus gros commiteur sur telle ou telle
techno selon différentes zones géographiques. C'est tout con, et ça le faisait
marrer, ce qui est largement suffisant pour un side-project.

Pour faire ça il a commencé à récupérer la liste de tous les users de GitHub et
leur localisation. Puis, il a récupéré l'ensemble des repos, leur nombre de
stars et les langages associés. Il y a ensuite un petit travail pour recoder les
coordonnées de location en quelque chose de plus exploitable par son système et
ensuite il faut mettre au point une petit formule de ranking de tout ce beau
monde.

Bon, l'avantage c'est que GitHub ouvre une [API][8] qui permet de récupérer
toute ces infos sans avoir besoin de crawler les pages manuellement. Le problème
c'est que la masse de données est énorme et GitHub ne permet que 5000 appels par
heure par clé d'API. Néanmoins, GitHub propose une version "bulk" de son API qui
expose moins d'informations mais permets d'en récupérer plus d'un coup.

Heureusement, il existe à coté le projet [GitHub Archive][9] qui indexe depuis
2011 l'ensemble des activités sur tous les repos de GitHub. C'est à dire les
commentaires, les PR, les clones, etc. Tout ceci représente beaucoup de données
mais est requêtable avec [Google Big Query][10] et l'ensemble du dataset, bien
que conséquent, peut être monté en mémoire avec [Redis][11].

Du coup, après le coté technique, Vincent à souhaité tester le coté commercial.
Il a posté sur [HackerNews][12], a été featuré sur [ProductHunt][13] et a ainsi
réussi à atteindre les 200 millions de visiteurs (ce qui représente quand même
15% des utilisateurs de GitHub). Ce qui est impressionnant c'est que son site
web est un simple Rails (protégé par un bon système de cache) et qu'il a bien
tenu la charge.

Sa conclusion, que je partage, c'est qu'il ne faut pas laisser trainer ses
side-projects. Il faut les sortir du placard rapidement, pour qu'ils ne prennent
pas la poussière, et se donner un temps limité pour éviter cet effet d'abandon.

## Licences open-sources

{% youtube https://www.youtube.com/watch?v=j2n6MargPj8 %}

Le second talk, je l'attendais avec impatience.  [Mickael Andrieu][14]
souhaitais nous parler de licences Open-Source et des différences entres elles,
ce qui est un sujet bien obscur pour moi.

Malheureusement, je n'en sors pas avec beaucoup plus d'informations qu'avant. Je
ne me risquerai pas à faire un résumé du talk car je dois bien avouer que je
n'ai rien compris aux explications.

J'ai bien compris qu'il y avait une forte différence entre Libre et Open-Source,
mais je suis toujours aussi incapable de l'expliquer précisément, et je ne sais
toujours pas expliquer la différence une MIT, GPL et Creative Commons.

Ah si, j'ai noté qu'il avait créé un site, [www.choisirunelicence.com][15] qui
doit expliquer tout ça en détail.

## B.A.-BA du scraping

{% youtube https://www.youtube.com/watch?v=45EurjpgqhI %}

[Alexandre Gindre][16], ex collègue d'[Octo][17] nous a ensuite [parlé de web
scraping][18]. Il a tout présenté dans des beaux slides brandés Octo mais il
a bien précisé que ce dont il allait nous parlait n'était pas fait dans le cadre
d'Octo. En effet, certaines parties du scraping sont assez floues vis-à-vis de
la légalité.

Déjà, il faut bien faire la différence entre le scraping et le crawling. Le
crawling va récupérer la totalité d'un site externe pour l'indexer tel quel de
son coté (ce que fait Google typiquement). Le scraping de son coté va
"uniquement" extraire certaines infos du site.

L'archi nécessaire pour faire du scraping est assez simple mais est à peu de
choses près toujours la même. Dans un premier temps on va requêter le site
cible, si possible caché derrière un proxy, et on va en extraire les données
intéressantes. On va ensuite stocker ces données chez nous et les présenter dans
une nouvelle UI, avec de nouvelles features.

Alors, est-ce que c'est bien légal ? C'est là que c'est flou. Normalement,
d'après la loi du droit d'auteur sur les bases de données, ce qui est sur un
site appartient à son auteur. Mais en même temps, si ces données sont
accessibles publiquement, il peut être admis qu'on puisse les utiliser. La
jurisprudence vient rajouter un part de complexité dans l'équation aussi.
[Opodo][19] avait scrapé les pages de [Ryanair][20], et Ryanair avait alors
porté plainte, mais Opodo a fini par gagner le procès car Ryanair n'a pas pu
prouver que le scraping leur avait porté préjudice, bien au contraire.

Par contre, si jamais le site cible indique clairement qu'il ne faut pas le
scraper, alors il ne vaut mieux pas s'y frotter. C'est par exemple le cas de
[societe.com][21]. Quand à savoir si une telle indication
a réellement une force légale, c'est moins sur.

Ce qui est sur par contre c'est que même si le scraping en lui-même n'est pas
interdit, il faut faire attention aux méthodes utilisées. Si on tape dessus
comme un bourrin et qu'on mets en péril la stabilité de la plateforme, on risque
d'être apparenté à un DDoS, ce qui est cette fois tout à fait répréhensible et
relève du pénal.

On connait Opodo comme site de scraping qui agrège les données de plusieurs
sources, mais il en existe plein d'autres. Il y a [PriceWiki][22] qui scrape le
prix d'objets de la vie courante de différents pays afin de comparer le prix de
la vie.  [Rapportive][23] qui mets en commun les informations de LinkedIn, les
photos et les adresses mails d'une personne.  [GetHuman][24] qui scrape les
sites webs pour en extraire les adresses mails des gens à contacter. 

Si vous voulez le faire vous-même, il existe quelques outils en SaaS qui peuvent
vous mâcher une grosse partie du boulot.  [Kimonolabs][25] qui en quelques clics
vous transforme n'importe quelle page en une API. [Import.io][26] qui vous
propose un GUI pour vous permettre de scraper n'importe quoi, s'occupe de vous
masquer derrière un proxy et vous prévient en cas de mise à jour.

En un peu plus manuel, il y a [Scrapy][27] et [ScrapingHub][28] pour la version
SaaS qui vous permet d'héberger vous même le scraper, de gérer la fréquence de
mise à jour et le pool d'ip à utiliser.

Si vous voulez le faire à la main, la combo [Tor][29], [Squid][30] et
[Polipo][31] permet de facilement anonymiser ses connections. Après pour parser
le HTML et en extraire les infos intéressantes il y a [Nokogiri][32] en lib Ruby,
mais celle-ci ne gère pas toute la logique de connexion, gestion des erreurs
HTTP, etc. C'est juste une lib de parsing HTML, donc il vous faut obtenir le
fichier initial.

Il a fini par quelques conseils de sioux pour éviter de trop se faire remarquer.
[Hidemyass][33] pour changer son ip facilement. Envoyer de simples requêtes curl
en HEAD pour checker si la page a été mise à jour ou non. Regarder les flux RSS
qui sont une source énorme d'infos sur les pages du site. Regarder les
`robots.txt` et les sitemaps, et envoyer un faux header pour se faire passer pour
Google Bots ouvre aussi pas mal de portes.

Un talk super intéressant, pour une discipline que nous avons tous déjà du
pratiquer au moins une fois, mais qui est toujours aussi casse-gueule et
manuelle.

## BackBee

Et donc, le dernier talk, au pied levé par Mickael (qui nous avait déjà présenté
les licences libres un peu avant). Il nous a parlé de [BackBee][34], le CMS
"_orienté gestion de contenu_" (?) qu'il développe, fondé sur [Symfony][35] et
[Doctrine][36].

Encore une fois, j'ai pas réussi à vraiment comprendre ce qu'il faisait. Je me
souviens qu'il y a de la config en yaml, un client js en front distinct du back,
un système de templating, une API Rest, la possibilité de faire de l'edit in
place mais très honnêtement je serai bien incapable de dire ce que ça fait
réellement.

## Conclusion

Au final, une soirée sympa mais malgré tout placée sous le signe du fail.


[1]: http://www.deezer.com/
[2]: https://twitter.com/vdaubry
[3]: http://youboox.fr/
[4]: http://github-awards.com/
[5]: https://speakerdeck.com/sachag/side-projects
[6]: https://twitter.com/SachaGreif
[7]: http://github-awards.com/
[8]: https://developer.github.com/v3/
[9]: https://www.githubarchive.org/
[10]: https://cloud.google.com/bigquery/
[11]: http://redis.io/
[12]: https://news.ycombinator.com/
[13]: http://www.producthunt.com/
[14]: https://twitter.com/mickael_andrieu
[15]: http://www.choisirunelicence.com/
[16]: https://twitter.com/alexgindre
[17]: http://www.octo.com/
[18]: http://www.slideshare.net/AlexandreGindre/le-baba-du-web-scraping
[19]: http://www.opodo.com/
[20]: https://www.ryanair.com/
[21]: http://www.societe.com/
[22]: http://www.pricewiki.com/
[23]: https://rapportive.com/
[24]: http://gethuman.com/
[25]: https://www.kimonolabs.com/
[26]: https://import.io/
[27]: http://scrapy.org/
[28]: http://scrapinghub.com/
[29]: https://www.torproject.org/
[30]: http://www.squid-cache.org/
[31]: http://www.pps.univ-paris-diderot.fr/~jch/software/polipo/
[32]: http://www.nokogiri.org/
[33]: https://www.hidemyass.com/
[34]: http://www.backbee.com/
[35]: https://symfony.com/
[36]: http://www.doctrine-project.org/
