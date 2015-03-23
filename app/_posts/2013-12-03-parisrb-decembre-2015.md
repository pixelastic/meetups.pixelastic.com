---
layout: post
title: "ParisRB Décembre 2013"
tags: parisrb
---

Paris.Rb dans les locaux d'Epita, grand amphi, comme d'habitude. Début de la
session officiellement à 19h30, mais premier véritable talk à 21h. Avant ça,
présentation de Paris.Rb, pizza et bières.  

## Tizen

Romuald Rozan, d'Intel, nous a présenté Tizen, un OS Open Source basé sur le
noyau Linux. Destiné à être multi-support (tablette, mobile, desktop, voiture,
tv, appareil photo), il est poussé globalement par Intel et Samsung mais avec
des partenariats avec d'autres fabricants et opérateurs. Résultat du merge de
deux projets internes à Samsung et Intel.

Pas vraiment convaincu de la conférence, c'était plus un message à enrobage
commercial qu'autre chose. La question lui a été posé des différences entre
Tizen et FirefoxOS. Il a répondu qu'il n'avait pas pour habitude de dire du mal
des concurrents, qu'il suffisait d'aller voir ce que faisait FirefoxOS pour
voir en quoi Tizen était différent… Il a aussi laissé sous-entendre que Tizen
était poussé par des gros du hardware et destiné à tourner sur du matériel de
plus haut de gamme que FirefoxOS.

## Phusion Passenger

Présentation de Hongli Lai, qui était de passage à Paris pour dotJS et qui nous
a présenté Phusion Passenger, et surtout les améliorations apportées ces
dernières années. Passenger est un serveur qui fait la liaison entre un
webserver (Apache, Nginx) et une appli Rails qui tourne derrière. Il
a rapidement comparé Passenger à ses concurrents : Mongrel, Thin, Unicorn et
Puma.

Il a mis l'accent sur le fait que Passenger execute beaucoup d'automagic dans
sa config et possède des adapter pour Apache et Nginx qui font presque tout
tout seul (il a comparé à une config typique de Unicorn qui semble beaucoup
plus complexe –mais qui propose peut-être justement plus de fine-tuning ?–).

Niveau perf, il a aussi benchmarké contre Puma, qui est plus rapide sur les
benchmarks, mais où les différences de perfs ne sont plus perceptibles in real
life, sur une appli déployée. Il a de toute façon précisé que si on cherche
à avoir une appli avec de bonnes performances, il ne faut pas faire du Rails,
ou alors le blinder derrière du cache et du load balancing.

A part ça, Passenger permet de restarter automatiquement l'appli en cas de
crash, de laisser nginx servir les fichiers statiques, d'utiliser des sockets
unix pour communiquer si disponible, se scale automatiquement en cas de traffic
en spawnant de nouvelles instances du serveur sur chaque CPU de la machine, et
il permet aussi l'utilisation de web sockets. Et tout ceci est monitorable
depuis la command line avec passenger-status. Il permet aussi d'envoyer un mail
ou un log avec la stacktrace complete lors d'un crash.

Ils ont aussi grandement facilité l'installation avec des dépots officiels
Debian, Ubuntu et Homebrew. Marche sous heroku et peut même servir de serveur
devant du nodejs ou du python (même si j'ai pas trop compris le use-case).

Le seul drawback, si on veut l'utiliser avec nginx est qu'il faut une version
spécialement compilée de nginx, mais qui est fournie avec passenger.

Il existe aussi une version pro de passenger, qui intègre des features
supplémentaires, mais tous les bugs sont d'abord fixés sur la version open.

## Zeus

Lightning talk à propose de Zeus, qui permet de preloader en mémoire son appli
rails et donc de pouvoir ensuite executer toutes les taches `rails console`,
`rails tests`, etc de manière quasi-instanée. En utilisant `parallel_test` en
complément de Zeus, on peut même executer ses tests en parallele sur chaque CPU
de la machine, de manière à réduire drastiquement le temps d'execution des
tests (exemple présenté sur : 14mn de tests de base, ~6mn avec
Zeus+ParallelTest).

## Code Reviews

La dernière conf était celle qui m'interessait le plus sur le programme.
Christophe Philemotte, de 8th Color nous a parlé des code reviews, des outils,
et de la manière dont ils le font dans sa boite.

Il a commencé par rappeller l'utilité d'avoir des tests : pour vérifier d'abord
que tout fonctionne, mais aussi pour éviter la non-regression, servir de
documentation, ne pas oublier les edge-cases, et au final accélérer les cycles
de dev.

Ensuite, il a évoqué l'autre facteur de création de qualité selon lui : les
code reviews. Toute nouvelle feature, tout bug fix, est relu par un autre
membre de l'équipe. Cela créé une discussion et permet de partager la
connaissance du projet au sein de l'équipe, d'éduquer l'équipe, de détecter des
bugs qui auraient pu passer devant une seule paire d'yeux. Mais ça améliore
aussi selon lui la lisibilité et la consistency du code ainsi que le
co-ownership de celui-ci. Et au final, une fois encore ça accèlere les cycles
de dev.

Pour faire ça, ils utilisent plusieurs outils qui, en plus des tests, leur
permettent de régler automatiquement certains des soucis de leur code avant de
le soumettre au code review des autres. L'idée est que si un outil automatique
peut nous faire gagner du temps, c'est autant de temps gagner à discuter
constructivement avec un autre être humain sur du code, et donc profiter de son
experience et de sa pédagogie, ce qu'une machine ne peut pas fournir.

Ils passent donc leur code au travers d'une série de moulinettes, entre autres
:

- un linter, pour checker les syntax error très rapidement
- [Flog][1], qui évalue la complexité du code
  (nombre de loop, branching, etc) et se mettent d'accord sur une valeur de
  complexité maximum autorisée
- [Flay][2], qui teste la duplication du code au sein d'une
  codebase
- [Excellent][3], qui detecte le code smell
- [Rails best practices][4], qui comme son nom l'indique
  output les manquements aux bonnes pratiques (à fine-tuner quand même car il
  est un peu extremiste avec les options par défaut).
- [BrakeManScanner][5], qui vérifie le code pour y trouver des
  vulnérabilités de sécurité
- [Rubocop][6] qui checke le code en suivant le Ruby
  Style Guide et qui peut même corriger certains soucis de lui-même.

Si on ne veut pas s'occuper d'installer tout ces outils, il existe des
solutions en SaaS comme [CodeClimate][7] et [PullReview][8]
(le dernier étant fait par le speaker).

Son conseil est de commencer par un des outils présentés, n'importe lequel, et
l'incorporer dans son workflow. Puis une fois maitrisé, en rajouter un autre,
et ainsi de suite, et une fois que tout ce qui peut être automatisé l'est,
passer aux code review manuelle.

Il mettait en garde contre les défenses naturellement humaines que les codeurs
ont contre les pull review, la sensation d'être testé, surveillé, quand on
commit, et que cela peut créer un climat complétement contraire au but
recherché.


[1]: http://ruby.sadi.st/Flog.html
[2]: http://ruby.sadi.st/Flay.html
[3]: https://github.com/simplabs/excellent
[4]: https://github.com/railsbp/rails_best_practices
[5]: http://brakemanscanner.org/
[6]: https://github.com/bbatsov/rubocop
[7]: https://codeclimate.com/
[8]: https://www.pullreview.com/
