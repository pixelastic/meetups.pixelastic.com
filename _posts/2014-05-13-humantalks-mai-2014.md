## Introduction

HumanTalks chez Adobe, dans leurs magnifiques locaux. La "sécurité" à l'entrée
était un peu longue à passer du coup les talks ont pris pas mal de temps à se
lancer, et le manque de pizza pour combler nos estomacs à la fin s'est bien
fait sentir.

Néanmoins les présentations étaient globalement très intéressantes.

## Cache Manifest

Présentation trollesque sur cache manifest. Le speaker annoncait que les
systèmes de cache natifs des browsers et des serveurs (ie. les entetes de cache
HTTP) n'étaient pas assez robustes et que le cache manifest était donc la
solution pour parfaitement avoir la main sur ce qui était caché et ce qui ne
l'était pas. Il est même allé plus loin en parlant des développeurs qui
désactivent automatiquement le cache avec les outils de dev de Firefox et de
Chrome et qui mettaient ses serveurs à genoux en démultipliant les requetes et
que le cache manifest encore une fois était la solution à ces problèmes.

La suite de son talk annoncait que le cache manifest avait même un effet bonus
qui permettait le travail online, et que c'était facile de détecter si le
browser était offline ou non avec `navigator.onLine`...

Mouais.

Je ne suis pas du tout convaincu par ces arguments, les mécanismes de cache
HTTP du browser et du serveur sont parfaitement adaptés à mon gout une fois
qu'on comprends bien l'utilité de chaque header. Idem pour `navigator.onLine`
qui a un comportement tellement différent selon les navigateurs que cela le
rends inutilisable.

Finalement la conférence était plus un pretexte à troller Windows, IE, Flash et
compagnie plutot que d'apporter des arguments interessants pour l'utilisation
du cache. Le plus frappant était surtout que j'avais vu deux conférences à la
QCon (Steve Souder et un mec de Hoodie, qui sont quand même des pointures) dire
à peu près tout le contraire : que le cache est une bonne idée dans la théorie
mais que l'implémentation rends la chose très fragile -propos confirmés par
deux collègues d'Octo qui y ont touché de près-.

## Git Deliver

`git deliver` est un ensemble de scripts git et bash qui permettent de faire
des déploiements facilement directement depuis git.

L'idée est d'utiliser les remotes de git pour y pusher du code. Plutot que de
faire un `git push`, on fait un `git deliver` en spécifiant la remote et le
sha/tag/branch que l'on souhaite pusher.

Le système se charge ensuite de mettre le working directory dans un dossier
accessible et propose tout un tas de hooks pour effectuer différentes actions
après le push, avant de mettre dans le working directory, à la fin, etc. Comme
par exemple passez un validateur de code, lancer un process de build, jouer les
tests, mettre à jour une config, etc. Si un de ces scripts retourne une erreur,
le déploiement n'est pas effectué.

Il garde un historique de `n` déploiement précédents, et la possibilité de
faire des rollback facilement.

C'est au final assez proche d'un outil comme Capistrano, mais son avantage est
qu'il n'a besoin que de git et bash pour tourner, donc extremement facile
à mettre en place.

C'est parfaitement adapté pour des technos comme PHP qui peuvent s'executer
direct depuis le working directory, ou un site purement front. Pour d'autres
technos ça demande un peu de tweaks des scripts de trigger (mais ils sont fait
pour ça). Si jamais l'archi nécessite des déploiements sur plus d'un serveur,
ça devient rapidement moins adapté.

## La vie d'un manager

Un ancien développeur nous a raconté son parcours à travers plusieurs boites de
différentes tailles, et comment il est passé de dev à manager et ce que c'est
que d'être manager.

Globalement, son image c'est qu'on a le cul entre deux chaises. D'un coté des
devs qui veulent s'éclater sur des technos interessantes et de l'autre des boss
qui veulent rentabiliser leurs applis sur des technos plus anciennes. Le role
du manager est de réussir à comprendre les envie des deux, les langues des
deux, et les faire se comprendre.

La qualité la plus importante pour lui est d'instaurer la confiance, notamment
au travers des 03 qui doivent être honnetes (pas de manipulation),
confidentiels (ce qui se dit dans un O3 reste dans l'O3) et dans lesquels le
manager doit réellement écouter.

Son conseil principal quand on est un dev et qu'on devient manager par la force
des choses, c'est de commencer par NE RIEN FAIRE. Le travers des jeunes
managers est de vouloir organiser trop de choses et devenir donc trop rigides.

Son devoir est aussi de cadrer les développeurs : booster celui qui est
paresseux, challenger celui qui est trop confiant, donner confiance à celui qui
est trop timide, et calmer celui qui est trop casse-cou.

A coté de ça, il lui faut présenter le travail de l'équipe aux boss, dans des
termes qu'ils comprennent, et parfois sur des trucs très simples (la liste
d'acronymes sans fin et de termes barbares qu'on emploie tous les jours). Il
donnait l'anecdote du chef de projet qui avait un jour conseillé que "si les
développeurs se mettaient à un par poste plutot qu'à binomer, ils iraient deux
fois plus vite...".

Sinon un dernier truc assez vrai mais que je n'avais pas remarqué, c'est qu'on
a une certaine réputation d'enfants gatés : on travaille dans un milieu où il
est facile de trouver du travail, en plus on fait un métier peu fatiguant
(rester assis devant un écran, c'est pas bien crevant), on a du matériel haut
de gamme et on se plaint encore de pas avoir les dernières version. Et en plus,
on fait nos autistes à travailler avec notre casque sur les oreilles. Tout ça
donne une mauvaise image pour qui ne connait pas le métier, il faut donc faire
attention à ne pas alimenter les clichés.

Il a finalement terminé en disant que le management, c'était basé
essentiellement sur des ficelles de manipulation ("comme toutes les relations
humaines"), savoir qui est influent, ce qui l'intéresse, ce qui le touche, ce
qui l'embete, ce qui lui plait, etc, de manière à créer une cohésion de groupe
qui ne se serait pas forcément créée d'elle-même.

## Les nouveaux outils Adobe pour les Web Designers

La dernière conf', vu qu'on était chez Adobe, était sur les prochains produits
et évolutions de produit Adobe. Présenté par
[https://twitter.com/mchaize](@mchaize) qui bosse là bas et qui a pu nous
donner une vision honnete de ce qu'il se passe chez Adobe.

D'abord, c'est des améliorations dans la prochaine version de Photoshop.
Photoshop est un logiciel vieux, au lourd passif de codebase legacy, qui
n'était pas du tout destiné à faire du design web mais qui a du évoluer au fil
des ans. Ils font ce qu'ils peuvent pour aider le travail des webdesigners et
webdeveloper.

Et deux nouvelles features très interssantes : la première étant d'avoir des
objets liés entre plusieurs `.psd` et `.ai`. On peut importer un fichier
vectoriel `.ai` dans un `.psd` et quand le modifie, celui le mets
automatiquement à jour dans le `.psd` (du moment que 'toshop peut accèder au
fichier sur le disque). Ainsi, plusieurs designers peuvent travailler sur le
même projet du moment qu'il est découpé en plusieurs fichiers.

Deuxième feature, carrément plus intéressante pour un webdev comme moi : Il
suffit désormais de nommer ses calques avec des noms de fichiers pour qu'ils
soient automatiquement exportés. Par exemple, un calque `banner.jpg` sera
exporté automatiquement dans le même dossier que le `psd`, et mis à jour
automatiquement dès qu'il est modifié dans le psd. Plus de galère pour
retrouver le ou les calques à exporter à chaque modif du `psd`. On peut même
spécifier la compression et/ou la qualité (ie. une version à 200% pour retina,
une à 100% sinon). Ca accepte du `jpg`, `gif`, `png` et `svg`.

Dernière amélioration, c'est le Project Parfait, un site internet d'Adobe où on
peut uploader un psd et le voir en live dans son browser. On peut alors
survoler les éléments pour voir directement leurs dimensions et leur
positionnement sur la page. On a la liste des couleurs utilisées avec leur code
hexa. Selectionner un élément de texte nous donne automatiquement les règles
CSS associées (font, size, color, shadow, etc). Sélectionner deux éléments
indique leur espacement, etc. Bref, un gain de temps sur toutes les
fonctionnalités qu'on doit faire et refaire quand on doit intégrer un psd en
CSS/HTML. Et le super effet kisscool bonus c'est que ça permet de faire
directement sauter aux yeux les incohérences des designs ("pourquoi la marge est
de 6px ici et de 4px là ?", "Pourquoi y a 12 gris différents et 6 polices ?").

J'ai aussi appris que photoshop possédait une API pour le piloter en headless
avec [http://github.com/adobe-photoshop/](plein de plugins dispos).




