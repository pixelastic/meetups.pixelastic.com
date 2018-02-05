---
layout: post
title: "Paris Hacker #12"
tags: parishacker varnish
---

12 édition de [ParisHacker][1]. J'étais allé aux premières éditions il
y a quelques années, où on discutait des top topics d'[HackerNews][2], où chacun
pouvait présenter quelque chose en 5-10mn, où des questions étaient posées à la
cantonnade.

Tout ce coté s'est un peu perdu, et j'ai plus l'impression d'aller à un meetup
de devs (globalement experimentés), voir quelques présentations sur des sujets
divers, mais sans forcément de fil conducteur.

Bref, cette fois-ci, c'était chez [Tektos][3], un
incubateur du coté de Marcadet-Poissonniers. Ils incubent des startups assez
longtemps (ils en ont une avec 40 employés), et semblent se spécialiser surtout
dans les startups tournées vers un marché anglophone.

On a eu le droit à une petite panne de courant dans la salle du meetup qui nous
a obligé à nous déplacer dans une autre salle avant que les talks ne commencent
réellement.

## Hosting large audience websites with Varnish

[Maxime Kurkdjian][4] d'[Oxalide][5] nous a parlé de leur business d'infogérance
des gros sites de presse français. Le début de la conférence était en anglais
(ce qui est d'usage aux ParisHacker), mais Maxime avait beaucoup de contenu
à nous faire passer et la barrière de la langue l'obligeait à limiter les
informations qu'il souhaitait faire passer. On a donc décidé de revenir en
français pour la fin de la conférence, et c'était du coup beaucoup plus riche.

Oxalide s'occupe des sites de [20 minutes][6], l'[Express][7], [le parisien][8]
ou encore [Radio France][9]. Leur cœur de métier est l'amélioration des perfs et
la tenue de charge dans les métiers des médias et de la presse.

Ce sont des sites qui possèdent beaucoup de contenu, avec de nouvelles pages
ajoutées chaque jour. En cas d'actualité intense, les serveurs sont très
demandés, et les pages mises à jour régulièrement. Les articles les plus
récents sont beaucoup plus demandés que les articles anciens. Il faut donc
réussir à faire scaler tout cela, idéalement sans avoir à changer le parc
informatique existant, mais juste en rajoutant le bon système de cache devant.

Le 7 Janvier, les attentats de Charlie Hebdo générent un nombre record de pages
vues sur leurs services. 56.000 requêtes / seconde en moyenne, pour plus de 157
millions de visites dans le mois. C'est la plus grande affluence qu'ils aient
jamais eu a gérer.

Le challenge d'Oxalide, c'est de réussir à gérer de gros traffic, sur des sites
qui ne sont pas forcément bien optimisés pour de la perf. Il lui a été posé la
question en fin de session "Si j'ai un site avec 500 millions de requêtes par
jour, ça me couterait combien chez vous ?". Il a répondu qu'il ne pouvait pas
donner de chiffres aussi facilement, parce que cela dépends pour environ 80% de
la dette technique du site qui est derrière. La techno n'a ici aucune
importance, c'est vraiment la dette technique et les améliorations sur les
serveurs d'origine qui vont être un facteur limitant.

Bref, revenons à Oxalide. Même s'ils peuvent mettre des tas de choses dans le
cloud, spawner de nouvelles machines en cas d'affluence, tout n'est pas si
rose. Le cloud nous fait croire que nous avons des ressources illimitées
à notre service, mais cela n'est pas complétement vrai. Tout simplement parce
que notre portefeuille, lui, n'est pas illimité. Il va donc falloir être
efficace avec les machines qu'on a.

### Continuous improvement

La première étape, c'est de se mettre des objectifs. Nous avons besoin de
réponses quantifiables à des questions simples. _Quel doit être le temps
de réponse maximum autorisé ?_, _quelle charge doit être tenue sans avoir
à dégrader l'UX ?_, _à quelle vitesse le site doit réagir à des pics de charge
?_, _quel est le response time autorisé en cas d'affluence ?_, etc.

On track toutes ces infos dans des dashboards qui nous donnent l'évolution
à court terme, et à long terme. Les seuils doivent être fixés par la direction
de l'entreprise. C'est elle qui sait, en fonction de son business model, ce
qu'il vaut mieux privilégier.

Il existe une batterie d'outils pour obtenir des metrics et les visualiser
à tout niveau de l'appli : [jMeter][10], [Tsung][11], [Apache Bench][12],
[Nagios][13], [Zabbix][14], [Munin][15], [AppDynamics][16], [ELK][17], [New
Relic][18].

### Tower Defense

Réussir à tenir face à une montée en charge, c'est comme jouer à un tower
defense. On doit protéger ses ressources les plus chères et les plus fragiles
de la horde de connexions qui vont arriver. Nos back-end PHP et nos DB mysql
font parti de ces assets à protéger.

On mets donc un cache [Varnish][19] devant. Il va absorber 90% des requêtes
directement. Ensuite, derrière le Varnish on rajoute quelques autres
protections pour réduire l'impact des requêtes qui sont passées : [APC][20],
[memcache][21], [query cache][22].

Avec un Varnish bien configuré, on peut multiplier la capacité d'un site par un
facteur de 100, et réduire le temps de réponse par un facteur de 10. Comme
effet bonus, avec un temps de chargement plus rapide, on améliore aussi l'UX
finale.

L'idée est d'avoir un taux de caching de 90% et de tendre vers un 100%.

### Varnish en détail

> La perfection, ce n'est pas quand il n'y a plus rien à ajouter, mais quand il
> n'y a plus rien à enlever.

Cette citation de St-Exupery est parfaite dans le domaine de l'optimisation de
montée en charge. On veut que chaque élément qui se trouve sur la zone de
défense entre les clients et nos serveurs finaux soient le plus rapide
possible, et pour ça, il faut qu'il soit le plus léger possible.

Oxalide préconise d'avoir deux lignes de Varnish. La première, la plus proche
des clients est la plus stupide possible. Elle sert de cache HTTP simple. Elle
peut contenir des dizaines de serveurs Varnish si nécessaire. La deuxième,
juste derrière, fait des choses un peu plus intelligentes. Elle active la
compression gzip, gère la validation des assets, etc.

En faisant ainsi la première ligne réponds très vite, et si une requête fait un
cache miss, elle va taper la seconde, qui est aussi bien rapide, sans avoir
à taper les serveurs d'origine. Cette topologie permet aussi de facilement
spawner des Varnish en première ligne, qui peuvent être dans le cloud, et donc
les décommissioner rapidement une fois la charge terminée. À noter que quand on
ajoute un nouveau Varnish dans un pool, il commence avec un cold cache, et va
donc devoir requêter l'origine pour se former son cache. Encore une fois, en
ayant un deuxième niveau de Varnish, il ne requête pas directement l'origine.

Attention toutefois au domino effect. Il faut faire attention à la consommation
de chacune des machines d'un pool de serveurs Varnish. Si on a deux machines et
que les deux sont environ à 50% de leur capacité, si l'une tombe, l'autre va se
manger toute la charge de la première, et dépasser ses 100% de capacité et
tomber aussi. Il faut toujours avoir suffisamment de machine dans un pool pour
que même si une machine tombe, la charge sur les autres ne dépasse jamais 50%.

### Hardware

Quand on doit gérer du très fort traffic, le commodity hardware ne suffit pas.
On veut des éléments qui répondent vite, et qui ne fassent que ça. Il faut donc
choisir son hardware en fonction, et Oxalide continue de monter des serveurs
physiques "comme avant", pour éviter la couche de virtualisation qui prends du
temps, et être au plus près du barebone.

Plusieurs optimisations peuvent se faire directement au niveau du BIOS, et la
configuration out of the box des machines du commerce ne fonctionne jamais pour
un besoin spécifique de grosse charge.

Le simple fait de changer la taille de la congestion window TCP permet des
gains de perfs de 30% sur le réseau.

### DevOps

Si on veut gérer un énorme traffic, il faut savoir qu'on va se planter
plusieurs fois avant d'y arriver. Pour ça, il ne faut pas avoir peur de
l'échec, et apprendre de ses erreurs. Il faut aussi une culture de devOps. S'il
y a séparation entre les équipes de dev et les équipes de prod, aucune
optimisation ne peut être fait.

Les ops fournissent aux devs des dashboard pour qu'ils puissent suivre
l'évolution des différentes mises en prod, des pics de charge actuels, des
fichiers les plus sollicités, des bottlenecks dans le code, etc (avec
[Kibana][23].  Comme ça les devs
peuvent aider sur ces points, trouver des solutions et avoir un vrai retour sur
l'implication de leur code sur leurs utilisateurs.

Encore une fois, le travail des dev, leur disponibilité, leur implication
a beaucoup plus d'importance dans la réussite de la montée en charge que
l'installation du Varnish devant. Pour Oxalide, 80% de la reussite ou non de la
montée en charge vient du code de l'appli et de sa dette technique. Varnish peut
aider, mais pas faire des miracles.

### Questions

Viennent ensuite plusieurs questions diverses.

Est-ce que Varnish peut être utilisé à l'intérieur d'un SI, entre deux apps qui
communiquent par API ? Oui, sans problème.

Est-ce que Varnish peut aider à cache une API en SaaS où chaque requête est
dynamique et dépends du user authentifié ? Oui, à partir du moment où deux
requêtes identiques donnent un résultat identique, Varnish peut aider. Si deux
fois la même requête donne un résultat dynamique différent, alors non.

Exemple donné de MediaPart qui a multiplié par 5 son nombre d'inscrits après
l'affaire Cahuzac. Ils n'ont pas changé leur infra, juste tweaké un peu plus
leur Varnish.

Est-ce que Varnish est aussi intéressant pour un site d'e-commerce que pour des
sites de presse ? Oui, sur un site d'e-commerce, 99% du site sera en cache dans
Varnish, seul le panier et le tunnel de paiement tapera sur l'origine.


## [Qleek][24]

On a ensuite eu la droit à un Skype avec [Pierre-Rudolf Gerlach][25],
co-fondateur et CTO de [Qleek][26].  Qleek est à mi-chemin entre le software et
le hardware, le dématérialisé et le physique.

C'est un petit bout de bois de forme hexagonale qui contient une puce RFID dans
laquelle on peut stocker n'importe quelle musique, film, playlist, image. Il
suffit ensuite de la poser sur un lecteur tout aussi sympa (en bois, de forme
douce) pour jouer l'élément en question sur la télé.

Ça permet d'avoir un support physique aux œuvres qu'on aime, sans avoir
à démultiplier les formats.

Pierre est un ex-[Joshfire][27], donc habitué des meetups
des ParisHackers. Il a aussi bossé sur le
[Nabaztag][28] donc tout ceci ne lui est pas
étranger.

Ils sont trois sur ce projet et après avoir été incubé à [Numa][29]
(ex-Camping), ils sont maintenant à [Bolt][30], un incubateur
hardware à Boston. Le Camping a pu les aider sur le début, sur la partie
entrepreneuriat, un peu sur le software, mais n'avait pas d'appui sur le coté
hardware.

Leur système fonctionne, ils peuvent en produire, mais ils ne peuvent pas
encore en produire en masse et l'incubateur en question va les aider à faire
ça. Ils y testent de nouveaux matériaux (liège, plastique, verre), testent leur
produit à des températures extrêmes, sous l'eau, sous une forte pression, pour
tester ses limites.

Coté software, c'est en grande partie du web, je crois que le backend est en
node mais pas sur. Coté hardware on a du RFID, du BLE, de l'ARM et de
l'Android. Tout ça dans un mélange de bois, métal, aimants, avec une impression
d'image sur le bois pour les personnaliser.

Il existe apparemment plusieurs accelérateurs hardware. Il
y a [Haxlr8r][31] à Shenzen ou encore
[Highway 1][32] à San Franciso. Le leur, Bolt, a incumé iRobot
(créateur du [Roomba][33] ou encore
[Pebble][34].  Il est en plein centre-ville de Boston.

La difficulté qu'ils rencontrent actuellement est sur la packaging. Il faut que
celui-ci puisse mettre le produit en valeur et expliquer en moins de 2s ce
qu'il fait. Il faut aussi beaucoup travailler sur le speech d'explication du
produit, et sur le nom à lui donner.

En bref, un REX très intéressant !

## Google Hash Code

Finalement, [Przemysław Pietrzkiewicz][35] de Google a présenté le
"[hackathon][36]" que Google organise bientôt.

Tous les participants travaillent sur le même problème par équipe de 2 à 4.
Google leur fournit un fichier d'input, et un problème à résoudre. Les équipes
doivent fournir un fichier d'output et une note leur est automatiquement
discernée en fonction de l'output. L'année dernière par exemple, ils avaient un
fichier représentant les rues de Paris et ils devaient calculer l'itinéraire
optimal pour qu'une Google Car les quadrillent.

Les inscriptions se terminent le 8. Je ne pense pas participer. Je m'étais
inscrit l'année dernière mais je m'étais fais recaler dès l'inscription car ils
avaient trop d'affluence. Cette année ils donnent un test préparatoire à faire
le soir comme épreuvre de pré-sélection.

Au final, passer des épreuves éliminatoires, pour ensuite tous être en
compétition pour résoudre un problème de Google me tente pas du tout. Je
préfère les hackathons open bar, où tout le monde construit des choses
différentes, innovantes, ensemble et pour le fun.


[1]: http://www.meetup.com/ParisHackers/events/220344692/
[2]: https://news.ycombinator.com/
[3]: http://tektos.co/811-2/
[4]: https://twitter.com/maxunder_
[5]: http://www.oxalide.com/
[6]: http://www.20minutes.fr/
[7]: http://www.lexpress.fr/
[8]: http://www.leparisien.fr/
[9]: http://www.radiofrance.fr/
[10]: http://jmeter.apache.org/
[11]: http://tsung.erlang-projects.org/
[12]: http://httpd.apache.org/docs/2.2/programs/ab.html
[13]: http://www.nagios.org/
[14]: http://www.zabbix.com/
[15]: http://munin-monitoring.org/
[16]: http://www.appdynamics.com/
[17]: http://www.elasticsearch.org/overview/elkdownloads/
[18]: http://newrelic.com/
[19]: https://www.varnish-cache.org/
[20]: http://php.net/manual/fr/book.apc.php
[21]: http://php.net/manual/fr/book.memcache.php
[22]: http://dev.mysql.com/doc/refman/5.1/en/query-cache.html
[23]: http://www.elasticsearch.org/overview/kibana/)
[24]: http://qleek.me/
[25]: https://twitter.com/pierregerlach
[26]: http://qleek.me/
[27]: http://www.joshfire.com/
[28]: http://fr.wikipedia.org/wiki/Nabaztag
[29]: https://www.numa.paris/
[30]: https://bolt.io/
[31]: http://www.haxlr8r.com/
[32]: http://highway1.io/
[33]: http://fr.wikipedia.org/wiki/Roomba)
[34]: https://getpebble.com/
[35]: https://plus.google.com/+Przemys%C5%82awPietrzkiewicz/posts
[36]: https://sites.google.com/site/hashcode2015/home
