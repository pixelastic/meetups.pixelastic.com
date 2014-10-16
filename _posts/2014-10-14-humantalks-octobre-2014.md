---
layout: post
title: "HumanTalks Octobre 2014"
tags: humantalks
---

Hier soir, comme tous les deuxième mardis de chaque mois, c'était les
HumanTalks. Cette fois, c'était Criteo qui accueillait l'évenement. On a eu le
droit à 4 présentations, précédées d'une petite présentation de Criteo.

Criteo fait de la publicité, et sachant que c'est pas la chose qui excite le
plus les développeurs, ils se présentent surtout comme une boite de techos,
avec une stack de technos hétéroclite et sexy. Ils annoncent aussi très
clairement qu'ils payent très bien, mais qu'ils ont un process de recrutement
très difficile. C'était clair, c'était franc, et on a rapidement enchainé sur
la première présentation.

## Developers in tech

Présenté par Jean-loup Karst de [breaz.io](https://breaz.io/), un site de
recherche d'emploi pour développeurs. Breaz "mets aux enchères" 7 à 10
développeurs par mois, dont les profils sont alors accessibles aux entreprises
enregistrées. Les entreprises sont filtrées pour n'accepter que celles qui
proposent de vrais produits techs (pas de SSII, pas d'agence, pas de gros
comptes). Le développeur se fait alors contacter par les entreprises qui sont
intéressées par son profil.

Du coup, breaz a pas mal de stats sur les technos qui sont actuellement le plus
recherchées, en back-end comme en front-end, et a pu nous faire un état des
lieux. Les statistiques énoncées représentent une sélection de 100 sociétés
parisiennes, créées depuis 2008, qui produisent une produit tech, donc elles ne
sont clairement pas représentatives du parc mondial des applications
actuellement en production.

![Stats de demande des technos backend](/public/img/2014-10-14/breaz.jpg)

On remarque que c'est toujours PHP qui est demandé majoritairement, avec
Python, Node et Rails ensuite. Rails a subi une explosion en 2010 avant de
redescendre progressivement, alors que Node au contraire a connu une montée
à la même période. Java était complétement absent du panel quand à lui.

Coté front-end, c'est sans surprise qu'on trouve Angular, Backbone et Ember
majoritairement comme framework MVC. jQuery garde une place de choix dans la
majorité des projets aussi.

A noter que si on compare ces statistiques aux chiffres mondiaux, englobant
toutes les sociétés et tous les produits actuellement en production, on arrive
à des données complétement différentes. Node, Ruby, Angular et Backbone, ici
très bien représentés, ne parviennent même pas à 1% du parc mondial historique.

Dans les questions-réponses qui ont suivi, il ressort que les profils qui ont
un Github actif sont plus contactés que les autres. Pour l'entreprise cela est
synonyme de passion, de curiosité, et d'une facilité à apprendre rapidement des
langages différents.

## Convaincre en quelques secondes

Le talk suivant, de [Richard Hanna](https://twitter.com/richardhanna), était
intitulé "Comment convaincre en quelques secondes".

Il conseillait de ne pas faire confiance à l'adage comme quoi l'habit ne fait
pas le moine. Pour lui, si on est mal habillé, notre interlocuteur va le
remarquer, alors que si on est bien habillé, c'est notre personnalité qu'il va
remarquer.  On juge de manière inconsciente sur les vêtements, le costume.

Il nous propose ensuite de regarder ses interlocuteurs dans les yeux, et de
sourire, afin de leur donner confiance. Se répeter mentalement 3 fois "Super,
super, super" avant de prendre la parole pour être souriant.

Faire attention au langage corporel. Les bras fermés sur le torse est un signe
de protection, on cherche à cacher quelque chose, ce qui peut donner à penser
qu'on n'est pas honnête. Il faut chercher à avoir un langage corporel proche de
celui de notre interlocuteur, de manière à le faire se sentir à l'aise. Il ne
s'agit pas là de singer ses mouvements, mais de prendre la même posture sur une
chaise par exemple.

Dans la formulation des idées, attention aux tournures négatives, préférer les
tournures sans ambiguité. Par exemple, ne pas dire "C'est pas mauvais, il ne
devrait pas y avoir de problème", mais préferer "C'est bien, tout va marcher
parfaitement".

## Gérez vos processus avec Kanban

[Antoine Roux](@antoine_roux) nous a fait un état des lieux et un retour
d'expérience de la méthodologie Kanban, qu'il mets en pratique dans sa société
depuis 4 ans.

En tant que développeur, notre métier est de produire des applications où
chaque nouvelle feature va apporter quelque chose de plus à l'utilisateur. Du
coup, il nous faut réussir à trouver un processus qui nous permette de nous
concentrer sur cet apport de valeur, de l'optimiser, et d'avoir un moyen de
répondre à la sempiternelle question "Pour quand est-ce que ça sera prêt ?".

Ces questions, elles ne sont pas spécifiques au monde du developement
informatique. Toyota s'est déjà posé les mêmes questions, et a donc mis en
place la méthodologie Kanban, qui lui a permis de devenir le premier
constructeur auto. Les américains ont repris la technique sous un nom
différent, le lean.

Le principe primordial est qu'on tire le flux du travail. Les phases en aval du
processus vont tirer les phases amont. On ne commence rien tant qu'un n'a pas
une demande client, et l'effet secondaire positif est qu'on ne crée pas de
stock. On se concentre sur apporter de la valeur au client. 

On a souvent dans nos projets des demandes qui n'avaient pas été prévues au
démarrage. Dans le Kanban, ça fait partie intégrante du processus. On accepte ce
changement et on le prends en compte, tout est tourné autour de ce principe.

Alors de manière concrète, comment est-ce qu'on mets ça en place ? C'est pas
bien compliqué, il suffit d'avoir un mur, des post-its, du scotch et un
marqueur. On créé trois colonnes sur le mur : Todo, Doing, Done.

Nos tâches sont forcément dans l'une de ces trois colonnes. Rien qu'avec ça on
a une vue d'ensemble des tâches de notre projet. Tout ce qui n'est pas dans le
Kanban n'est pas dans le process, et tout ce qui est dans le process est dans
le Kanban. En un coup d'oeil on peut voir si on est sous l'eau ou si tout va
bien. En utilisant un vrai mur physique plutot qu'une application, tout le
monde voit le même mur, tout le temps.

À partir de là, on peut améliorer en ajoutant de nouvelles colonnes qui
correspondent à de vraies étapes du processus de la société. Par exemple, des
colonnes backlog, dev, code review, QA, deploy, done. Mettre une colonne est
très importante. La QA c'est pas quelque chose à faire faire par une autre
équipe, la qualité fait partie du processus. Ce qui est livré, donc arrivé dans
la colonne done est fait avec qualité. La colonne deploy est aussi importante,
pour forcer l'équipe à aller le plus loin possible vers les utilisateurs
finaux.

Prochaine étape d'amélioration est d'ajouter les DOD (Definition of Done) entre
les colonnes pour que les actions actions à réaliser pour passer d'une colonne
à une autre soient claires. Les afficher sur le mur permet à tous les nouveaux
arrivants de rapidement comprendre comment fonctionne le processus.

Mais là où on commence vraiment à faire du Kanban by the book, c'est quand on
ajoute la notion de WIP (Work In Progress). On indique une limite au nombre
d'éléments dans une colonne, et en aucun cas cette limite ne peut être
déplacée. S'il n'y a pas la place pour passer un item, il faut alors concentrer
tous les efforts pour faire baisser ce WIP, en tirant les tâches vers la droite
pour les amener en done.

![WIP Limits en Kanban](/public/img/2014-10-14/kanban.jpg)

L'analogie qu'il donne est celle de l'autoroute. Si toutes les voitures de
l'autoroute sont concentrées au même endroit, tout avance lentement. Au
contraire, si elles sont espacées, elles peuvent toutes aller à leur vitesse
maximum. En limitant le nombre de tâches possibles en parallele, on s'assure
qu'elles soient terminées plus rapidement.

Afin d'isoler les possibles goulot d'étranglement, on fait un Stand-Up Meeting
tous les matins pour voir les points de blocage et s'il y en a, on mets la
priorité sur leur résolution avant toute autre chose.

Si toutes nos tâches ont environ la même complexité, on peut très facilement
estimer la durée moyenne de résolution d'une tache et donc planifier une date
d'atterrissage du projet. La difficulté arrive quand on a des tâches aux
complexités très différentes. Le plus simple est de commencer par découper les
grosses tâches en plusieurs tâches de taille plus petite. Les grosses tâches
ont la facheuse tendance à rester bloquées en Code Review très longtemps parce
que personne n'a envie de faire la Code Review d'un gros morceau de code.

Le gros avantage du Kanban est qu'il s'adapte à des processus existants, qu'il
ne faut qu'un mur et quelques post-its pour commencer, et qu'on n'est pas
obligé de tout prendre dès le début, on peut ajouter les éléments au fur et
à mesure.

Très très bonne présentation, j'ai enfin compris ce qu'était réellement Kanban.

Des personnes dans l'assistance ont confirmé que cela fonctionnait très bien
pour des équipes de support, ou de TMA, pour des listes de questions
à répondre, etc.

## JHipster

Dernière présentation à base de live-coding par [Julien Dubois](@juliendubois),
créateur de JHipster.

JHipster est un générateur d'application Java/Angular, basé sur Yeoman. C'est
open-source, y a plein d'étoiles et de forks sur GitHub et y a même des projets
en production qui l'utilisent.

Le J de JHipster est pour Java, et il vient avec une base de Spring (Spring
Boot, Spring Security, Spring Data JPA), du cache, du clustering, des
websockets. Le Hipster, c'est pour Angular, Grunt, Bower, HTML5 boilerplate et
Twitter Bootstrap qui font la couche de front.

L'une des force de JHipster est l'ensemble d'outils qui viennent avec. Coté
Java on a le choix entre du Maven ou du Gradle et coté front c'est Grunt ou
Gulp, au choix.

En termes pratiques, on lance un `yo jhipster` dans le terminal, on réponds
à quelques questions (SQL/NoSQL, Gradle/Maven, Grunt/Gulp, Java 7/8, etc) et il
nous prépare une application complète avec tout le tooling déjà configuré.
`pom.xml`, `Grunfile.js`, `package.json`, `bower.json`, tests unitaires, tout
est là.

![Live coding JHipster](/public/img/2014-10-14/jhipster.jpg)

On n'a plus qu'à lancer un petit coup de maven pour avoir un beau war
executable qui contient tout le code back et front (minifié) prêt à être
déployé. Il contient même tout un tas de fonctions de generator pour créer des
tables dans la base de données et les classes qui vont bien avec, ainsi que les
possibles relations entre les objets.

On a aussi accès à une interface d'administration qui nous donne toutes les
fonctions de CRUD basiques pour opérer sur nos objets, ainsi qu'une page de
monitoring de la JVM.

C'était vraiment bien pensé, ça m'a presque donné envie de faire du Java.

## Conclusion

Comme d'habitude, une très bonne session HumanTalks suivie de discussions
passionantes autour de pizzas et de sushis. Les
[HumanTalks](http://humantalks.com/) c'est tous les
deuxième mardis de chaque mois, dans plusieurs villes de France. S'il y en
a près de chez vous, je vous invite à aller y faire un tour.

Ce post est cross-posté sur le [blog
Octo](http://blog.octo.com/cr-humantalks-octobre-2014/).

