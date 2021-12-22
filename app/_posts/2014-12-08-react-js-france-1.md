---
layout: post
title: "React JS France #1"
tags: react
---

Premier meetup [React][], organisé par [Deezer][] et [Altima][], chez
Deezer. Bon panel de speakers pour une première, avec [Matthias
Lebrun][bloodyowl] d'Altima, [Yannick Croissant][yannickcr] de Deezer et
[Christopher Chedeau][vjeux] de React (Facebook).

## React, où comment simplifier la conception d'UI

On commence par Matthias qui nous fait une intro à React pour ceux qui ne
connaissent pas. Ça tombait bien, je ne connaissais pas et ça m'a bien donné
envie d'essayer.

Le principe de React est de simplifier la conception des UI, où tout est devenu
trop compliqué au fil des années. On avait un simple serveur qui nous renvoyait
du HTML au début, maintenant on a des SPA qui vont chercher seulement leurs
données depuis le serveur et doivent mettre à jour leur markup en fonction.

Avec React, tout est un composant. Chaque composant possède sa propre méthode
`render` qui doit retourner un markup HTML qui sera inséré dans le DOM.
L'avantage d'avoir une simple méthode comme ça pour chaque composant c'est que
c'est facile à tester unitairement. Les composants sont simples, petits,
isolés, et les méthodes sont donc faciles à tester.

Le composant possède aussi un état, une liste de variables internes qu'il peut
modifier en réponse à certaines actions de l'utilisateur ou recevoir depuis un
parent. Ces variables sont privées, et lui permettent de choisir les
modifications à appliquer au markup.

Le moteur de template de React utilise une syntaxe `jsx`, qui est croisement
entre du XML et du Javascript, ce qui fait un peu peur au premier abord. Mais
c'est juste du sucre syntaxique, React arrive avec son pre-processeur qui
transforme ce `jsx` dans nos fichiers js en du vrai js. Le pre-processeur
arrive avec quelques autres goodies d'ES6, et sans doute aussi dans le futur
avec des annotations, du type checking, etc.

Du coup, on a un vrai moteur de template, qui est tout simplement du js. On
peut y faire des conditions, des boucles, du `map`, `reduce`, bref tout ce
qu'on veut faire en js sans devoir passer par une complexe syntaxe de template.
Il est donc là inutile de réinventer de la logique dans un autre langage.

React continue sur sa lancée de simplification en faisant en sorte que tout
soit explicite. Ici, pas d'API polymorphe à la jQuery où les getters et les
setters se mélangent. On a même certaines fonctions qui sont déconseillées
(comme ajouter directement un `innerHTML`), et qui possèdent donc des noms bien
flagrants pour montrer qu'on fait quelque chose de mal quand on les utilise
(`dangerouslySetInnerHTML`).

Pour revenir rapidement sur la méthode `render`, qui est le cœur de React, on
a aussi autour la méthode `shouldComponentUpdate`, qu'on peut overrider pour
indiquer au moteur que non, là, vraiment, c'est pas la peine de faire un
nouveau rendering du component, je sais qu'il n'a pas bougé. Dans le même ordre
d'idée, on a accès aux events `willMount`, `didMount` et `willUnmount` pour
lancer du code custom à différents moment de la vie d'un composant.

React possède un très puissant algo de rendering, qui va checker le retour du
`render` d'un composant et de tout ses sous-composants pour savoir s'il doit
mettre à jour ou non son rendu. Il batche toutes les modifications ensemble
jusqu'au prochain rendering du browser, et rajoute un petit algo de diff pour
la route.

Autre parti-pris, qui va dans le sens de la simplification, il n'y a pas
d'héritage dans React, il n'y a que de la composition à base de mixins. On
défini des méthodes qu'on pourra implanter dans différents composants, quels
qu'ils soient (comme réagir à un event de scroll ou de resize par exemple).

React s'abstrait du DOM officiel aussi en réimplementant pas mal de choses,
mais en le faisant ainsi de manière cross-browser. Il réimplémente par exemple
le principe d'event capture et event bubbling, tout seul. Il en profite pour
rajouter une petit optim de perf dans l'histoire; plutot que de repasser une
nouvelle instance de l'objet event à chaque intermédiaire, il recycle toujours
la même liste de `x` objets qu'il passe à chacun des handlers.

Idem, il possède sa propre représentation du DOM pour savoir quand faire des
updates, qu'il appelle le virtual DOM (et je crois qu'ils utilisent JSDOM, mais
pas sur).

Globalement, j'ai été convaincu par React et j'ai bien envie d'essayer sur un
prochain projet ou side-project. La simplicité avec laquelle on peut gérer
notre affichage simplifie pas mal de chose. Le markup n'est plus du tout source
de la donnée, il se concentre juste sur afficher les choses d'une manière ou
d'un autre quand elles changent. Les algos de diff, super simples
à coomprendre, permettent de s'assurer qu'on ne render par les choses pour
rien, et les exposer sous forme de méthodes testables rends le truc encore plus
attractif.

Je pense que ça s'incruste facilement dans un projet Backbone, mais que ça doit
être la bonne galère de le passer dans de l'Angular.

## Isomorphic JS

La seconde présentation, de Yannick Croissant, nous parlait de Javascript
isomorphique, ou de comment générer la même application en front comme en back.
Bon, j'avais déjà assisté à son atelier à ParisWeb sur le même sujet, du coup
j'ai surtout écouté d'une oreille distraite et n'ai pas pris de notes.

Néanmoins, de mémoire il était question des problèmes que cause le fait de
partir en mode SPA. 

Déjà on duplique de la logique de code entre le back et le front, ce qui est
particulièrement flagrant au niveau des validations de formulaires. On veut
fournir une expérience riche, du coup on ne veut pas perdre du temps avec des
appels serveurs pour vérifier la validité d'un champ de formulaire, et on veut
les tester rapidement en local, en y déportant des règles métiers. Mais on ne
peut pas non plus l'enlever du backend pour des raisons de sécurité. On se
retrouve donc souvent à coder deux fois la même chose, des deux cotés. Au début
de NodeJS on pensait que le fait d'avoir le même langage des deux cotés allait
permettre d'éviter de coder deux fois les choses, mais le langage n'a pas grand
chose à voir là dedans, la question est plus générique au niveau de l'archi.

Avoir une appli SPA pose aussi de gros problèmes en terme de référencement.
Même si Google comprends le JS, ou même si on peut faire des hacks à base de
phantomJS pour générer des pages statiques à servir aux robots crawleurs, ça
reste des pansements sur des jambes de bois. Le modèle n'est pas adapté.

React permet de solutionner ce problème de manière assez élégante. Le serveur
génère un HTML à servir au client, incluant du React, qu'il peut lui même
instancier et modifier, comme s'il tournait dans un browser. C'est un état
initial qui est servi au client. Puis toutes les mises à jours suivantes sont
simplement de nouveaux retours de l'API qui vont déclencher des mises à jour de
la vue dans le client. Si on reload complétement la page, la nouvelle page
rendue par le serveur retournera un nouvel état de départ, mais encore une fois
les nouvelles modifs se feront sous forme de diff. On a là une approche
incrémentale, qui permet des affichage de page plus rapides.

On touche là au meilleur des deux mondes. Sur une url données, dans un contexte
donné, notre serveur nous donnera un HTML parfaitement formé, parfaitement
adapté pour le crawling, le SEO, l'accessibilité, etc. Si le navigateur est en
mesure d'executer React, il peut mettre à jour la vue de manière incrémentale
en redemandant les nouvelles infos au backend, qui peut se permettre de la lui
retourner de manière simple sous forme de data.

## React, CSS in JS

Le dernier talk était de Chistophe Chedeau, de chez Facebook (et sans doute
connu de certains d'entre vous pour son boulot sur Curse Gaming). Il nous
a présenté React depuis sa création jusqu'à ce qu'il est aujourd'hui.

L'idée principale derrière Reacte était de simplifier la codebase de Facebook.
Des milliers d'ingénieurs qui bossent sur du front-end en même temps, avec des
compétences en HTML/CSS très variées. Il n'y a pas vraiment de dev front chez
Facebook, tous les devs travaillent sur toutes les parties, qu'elles soient
back ou front. Du coup, ils ont souhaité abstraire au maximum certaines parties
du markup pour limiter les erreurs, et simplifier le développement.

Un des problèmes majeur de CSS qui se fait ressentir sur une codebase comme
celle-là, c'est que tout dans CSS est globales. On definit une classe, elle va
s'appliquer partout dans le markup. Certes on peut préfixer un selecteur pour
le rendre plus precis, mais on n'est jamais sur à 100% d'avoir une isolation
parfaite. Un autre dev peux, consciemment ou non, overrider nos styles. En
utilisant une méthode comme BEM, on peut limiter ce problème mais alors on
rends le code extremement difficile à minifier, avec des classes à rallonge sur
presque tous les éléments.

Le second problème majeur est qu'il est très difficile de supprimer du code. Il
n'y a pas de couverture de code comme dans d'autres langages qui pourrait être
déduite par des tests unitaires. Quand on supprime du CSS, on ne sait jamais
réellement ce qu'on va casser.

Et pour finir, ils souhaitaient un moyen simple de pouvoir partager des
constantes entre PHP, Javascript et CSS (un code couleur, un nombre d'éléments
à afficher, un flag de feature flipping, etc).

Ils ont donc planché sur un moyen de créer des composants isolés, qui chargent
leurs propres dépendances, qui ne se fassent pas overrider par l'extérieur et
qui ne puissent pas non plus le faire.

Leur action principale, pour obtenir ce pouvoir, a été de convertir le CSS en
Javascript. Tout simplement en React, ils n'écrivent pas leurs propriétés de
style dans du CSS mais dans des objets JSON (légérement améliorés avec quelques
helpers). Cette partie m'a un peu fait peur, et a continué à me suprendre dans
le reste de la présentation. Finalement, après en avoir discuté avec d'autres
devs qui font déjà du React régulièrement, cette approche n'est pas obligatoire
et est même rarement employée : on continue d'utiliser des classes pour le
style.

Bref, ces propriétés JSON/CSS sont ensuite appliquées directement en `style=`
sur les éléments du markup. L'avantage de cette méthode barbare est qu'on est
certain qu'on ne pourra pas se faire overrider par d'autres classes (`style`
a la prio la plus forte), et comme on ne déclare pas de classe, on ne va rien
overrider à l'extérieur non plus. C'est assez malin.

De plus, ils en profitent pour "optimiser" certaines règles au passage (si on
ne mets pas d'unité, c'est des px par défaut par exemple) ou comportement (un
`display:none` en React va carrément supprimer le nœud du DOM).

En fait, pas mal de comportements du DOM classique sont recodés en Javascript
en React. Quand j'ai vu les `onMouseEnter` / `onMouseLeave` pour recréer le
`:hover` j'étais assez dubitatif quand même. Le speaker annoncait que le fait
d'être particulièrement explicite de cette manière rendait le code plus simple
à comprendre. Je suis pas vraiment convaincu à premier abord, mais pourquoi
pas. Par contre, là où je le rejoins c'est que ça rends le code de rendu
vraiment plus facile à style. On peut écrire des tests unitaires qui vont
pouvoir manuellement passer un élément en `:hover` et tester un comportement en
allant regarder le contenu de l'objet de style.

Il a fini par nous expliquer deux-trois autres optimisation que le moteur de
React opère. Pour moi, ce n'est rien de plus que ce que le moteur natif du
browser execute, mais qu'ils ont recodé à la main, et ce qui leur permet de
s'affranchir des différences d'implémentations entre navigateurs. Je ne sais
pas trop quoi penser à ce sujet. Certes ça permet de simplifier le dev et
d'offrir la même expérience à tout le monde, mais ça fait réinventer la roue.

Plus le talk avancait et plus les démonstrations allaient dans ce sens et j'en
suis sorti en me demandant où ça allait exactement. Vjeux lui même annonçait
que React était jeune, qu'ils ne s'attendaient pas à ce qu'il prenne autant
d'ampleur en dehors de Facebook et qu'ils expérimentent des choses, mais que
tout ne sera peut-être pas bon à garder.

## Conclusion

Premier avant-gout de React, j'ai été assez séduit par la simplicité qui s'en
dégage. La dernière conférence m'a laissé plutot dubitatif (comme à chaque
fois qu'on essaie de remplacer CSS par JS parce que _"CSS c'est trop
compliqué"_).

[React]: http://facebook.github.io/react/
[Deezer]: http://www.deezer.com/
[Altima]: http://www.altima-agency.com/fr
[bloodyowl]: https://twitter.com/bloodyowl
[yannickcr]: https://twitter.com/yannickc
[vjeux]: https://twitter.com/vjeux


