---
layout: post
title: "HumanTalks Juin 2015"
tags: humantalks
---

Pour le mois de Juin, c'est Viadeo qui a pu nous accueillir. On avait 120
personnes inscrites, mais on était dans les faits plus proches d'environ 90 sur
place. Viadeo nous a accueillis dans leur cantine et on a pu ensuite se régaler
de ce que leurs cuistots nous avaient préparés.

Une session formidable, avec 4 talks passionnants pour contrebalancer la session
du mois précédent qui m'avait un peu laissé sur ma faim. Cette fois on a parlé
de RAML, de sociologie, d'UX et d'école de développement.

_Ce CR comporte des annotations directement par [Sylvain][1] qui m'a soumis une
[Pull Request][2]. Si vous aussi vous avez des corrections ou des points
à apporter, je vous invite à faire de même, c'est grandement apprécié._

# RAML <a name="raml"></a>

[Yves Pasteur][3] nous a parlé de RAML, un format
pour spécifier ces APIs. Le formalisme du langage permet ensuite
d'automatiquement générer la documentation qui va avec et pourquoi pas de la
tester automatiquement.

{% youtube https://www.youtube.com/watch?v=dOmL1QVbx4Q %}

On le sait tous, le gros problème de la documentation c'est qu'elle n'est jamais
à jour avec le code. Tout simplement parce que c'est une tâche pénible
et qu'on la néglige bien souvent. Ici, RAML se situe dans la même lignée que les
annotations, en permettant de spécifier son API en même temps qu'on la
documente. Spec et doc ne font qu'un.

RAML en terme de syntaxe, c'est du YAML, et ça veut aussi dire Restful API Model
Language. En gros, on peut définir plusieurs versions de notre API, et pour
chacune d'elle spécifier son url, ainsi que les endpoints possibles. On peut
bien sûr faire une hiérarchie de endpoints qui reflètent la hiérarchie de nos
url, et pour chacun des niveaux indiqués une petite description ainsi que les
paramètres attendus. 

Tout ceci sera alors utilisé pour générer automatiquement la documentation à la
manière d'un Swagger. Pour chacun des endpoints on peut bien sûr spécifier des
actions différentes selon le verbe utilisé, ainsi que la liste des paramètres
attendus (qu'ils viennent de l'url, d'une query string, d'un body ou même de
headers).

Pour chacun de ces paramètres, on peut spécifier le type attendu, s'il est
obligatoire ou non, et faire de même pour le type de réponse attendue ainsi que
le code retour. On peut aussi bien sûr spécifier des exemples pour chacun d'eux.
Pour ne pas écrire des fichiers trop énormes ont peut bien sûr utiliser des
templates et inclure des fichiers.

Tout ceci permet de définir notre API dans un format standardisé.
Il existe des parseurs de RAML dans plusieurs langages et déjà quelques outils qui en tirent
partie (génération de docs, tests d'intégration, voire génération d'un CRUD
simple).

Il y a plusieurs projets collaboratifs pour définir la spec RAML de certaines
API bien connues comme Facebook, Twitter ou GitHub. Il n'est pas encore possible
de détecter automatiquement quand une de ces API a ajouté de nouveaux endpoints
grâce à RAML, mais on peut déjà tester si certains retours ont changé ou si
certains endpoints ont disparu.

Je ne connaissais pas du tout RAML mais je préfère largement ce formalisme de
spec d'API que de faire un gros fichier doc, car c'est parsable et qu'on peut
donc à terme le tester et générer la doc qui va avec.

# Sociologie appliquée aux développeurs <a name="socio"></a>

Sous ce titre assez étrange, c'est Sylvain Abélard qui nous a fait un talk
ultra-touffu sur une douzaine de théorèmes et effets sociologiques qu'on est
forcément amenés à croiser dans le monde professionnel.

{% youtube https://www.youtube.com/watch?v=ZxHgqw8a08c %}

Beaucoup d'humour et passionnant, je vous recommande chaudement de regarder le
talk mais surtout d'aller lire davantage d'informations sur chacun de
ces effets.

Sylvain est développeur, mais quand sa boîte a commencé à grossir et qu'il a dû
embaucher d'autres développeurs il s'est retrouvé à aussi devoir les manager.
Mais lui il code, il ne sait pas forcément comment gérer des humains. Du coup,
il a fait comme pour tout nouveau framework qu'il ne connaît pas : il a lu la
doc. Et c'est donc après en avoir appris un peu plus sur la manière dont
fonctionne le cerveau humain et particulièrement dans un contexte d'équipe qu'il
nous a fait cette liste, _NdSAb: pour vous et votre chef_[^why_socio].


On a tous déjà remarqué[^other_talks] que plus une boîte grossit et plus on
a l'impression que les gens vont dans des directions différentes, que tout le
monde pense avoir (ou pas d'ailleurs) l'intérêt de la boîte à cœur, mais que
pour autant tout le monde n'est pas aligné. Et le pire c'est que la majorité du
temps, ce n'est même pas de la méchanceté, encore moins de l'incompétence, juste
des raisons différentes que chacun ne peut ou ne veut pas forcément exprimer.

Pour mieux comprendre tout ça, Sylvain a donc posé des mots et nommé une
douzaine d'effets, principes et théorèmes.

## [Principe de Peter][4] <a name="peter"></a>

Celui-ci est simple, et on le croise tous autour de nous. C'est tout simplement
que le principe même de hiérarchie et de promotion fait que des gens
incompétents se retrouvent à des postes hauts placés. 

Comment ça se fait ? Tout simplement parce que quand on est bon à ce qu'on fait,
on obtient une promotion pour accéder à une position plus importante _NdSAb: ou
pas_[^career_tips]. Au début on n'est pas très bon dans cette fonction, parce
qu'on y débute, mais on finit par apprendre. Alors on monte encore d'un échelon,
et encore d'un. Mais à un moment, on finit par ne plus monter, parce qu'on
a atteint le maximum de ce qu'on était capable de faire _NdSAb: je crois que
tout le monde peut progresser, attention au
"fixed-mindset"_[^fixed_growth_mindsets]

Sauf qu'on n'est jamais rétrogradé. On ne redescend jamais (disons très
rarement)[^stepping_down] au poste précédent, celui où on bon. Cela signifie
qu'au bout d'un moment, chacun se retrouve en poste à un poste où il n'est pas
bon.

Du coup, il faut être plus conciliant avec les "incompétents". Ils ne sont
peut-être pas bons à ce qu'ils font en ce moment, mais s'ils sont là c'est parce
qu'ils étaient très bons à autre chose avant.

... Ou que VOUS ne voyez pas à quoi ils sont compétents car VOUS êtes incompétent !
C'est à dire que vous êtes sujet au...

## [Dunning-Kruger Effect][5] <a name="dunning_kruger"></a>

Celui-ci, je l'adore. J'ai découvert la sensation il y a quelques années mais je
ne savais pas qu'il avait un nom (et c'est d'ailleurs Sylvain qui m'avait filé
le lien vers plus d'explication).

Cet effet explique simplement que _celui qui sait sait qu'il ne sait pas, alors
que celui qui ne sait pas ne sait pas qu'il ne sait pas_. En d'autres termes, si
vous êtes compétent dans un domaine, vous savez juger vos limites, vous savez
ce que vous savez faire, vous savez ce que vous ne savez pas faire, vous voyez
la réelle étendue du problème. Alors que celui qui est incompétent sera
incapable de juger la réelle difficulté d'une tâche. Parce qu'il ne s'y connaît
pas vraiment, il ne verra pas ce qu'elle implique réellement et elle lui
paraîtra simple car il ne verra pas toute la complexité cachée que vous pouvez
voir.

C'est malheureusement pour ça que les incompétents paraissent sûrs
d'eux[^dumb_sure] mais que les gens compétents paraissent douter.

## [Hawthorne Effect][6] <a name="hawthorne"></a>

Le nom vient d'une usine de Chicago dans laquelle on a voulu étudier la
productivité des ouvriers.

_Attention, l'anecdote ci-dessous est inexacte. Lisez la page Wikipedia pour en
savoir plus.  Je laisse cependant cette version car elle est simple, amusante,
que c'est celle de la vidéo, et qu'elle montre bien que Sylvain s'est fait avoir
par un Woozle Effect :D_

Un psychologue a cherché à savoir si le degré de luminosité de la
pièce où ceux-ci travaillaient avait un impact sur leur productivité.

Du coup, il a essayé d'augmenter la lumière pendant une semaine pour voir. Et il
s'est avéré que oui, les ouvriers produisaient plus. Du coup, la semaine
suivante il a encore monté encore plus la lumière et la productivité s'est
encore accrue. Alors il a tenté de la pousser au maximum, au point de les
éblouir et oui, ça a encore mieux marché.

Du coup, il s'est douté que quelque chose ne tournait pas rond dans son
expérience alors il a essayé de baisser la luminosité, en dessous du seuil
initial et là encore la productivité était meilleure. Complètement surpris, il
a remis la lumière à son état initial et là encore, productivité améliorée.

Il n'y comprenait alors plus rien. Jusqu'à ce qu'il réalise que le changement de
lumière n'avait aucun impact sur la productivité de ses employés. C'était tout
un tas d'autres facteurs : avoir son patron qui surveille, avoir une mesure
à atteindre, changer les conditions du bureau, etc qui influençait leur travail.

Le Hawthorne effect indique juste qu'en modifiant quelques éléments, aussi
subtils que changer son bureau de sens ou travailler dans un nouveau lieu donne
de nouvelles idées, change les habitudes et permet de travailler différemment,
bien souvent avec un effet bénéfique.

## [X-Y Problem][7] <a name="xy_problem"></a>

Celui-là est moins connu. On le retrouve quand on pose une question à quelqu'un
mais qu'on à l'impression qu'il répond à coté. On demande de l'aide à quelqu'un
pour résoudre le problème X, mais lui nous donne la solution pour résoudre le
problème Y parce que de son expérience, la cause du problème X est bien souvent
Y, alors il souhaite nous faire gagner du temps.

Sauf qu'en n'expliquant pas le processus, on à l'impression que l'autre ne
comprend pas notre problème, ou s'en fout, et ne nous aide pas. Et c'est
d'ailleurs tout à fait vrai, on n'aide pas quelqu'un en lui donnant la solution
à un problème qu'il n'a pas.

## [Effet d'audience][8] <a name="audience"></a>

Cet effet est assez simple et indique que parfois, regarder par dessus l'épaule
de quelqu'un quand il fait une tâche peut avoir un effet bénéfique, parfois cela
peut avoir un effet néfaste. En effet, quand une tâche est simple, on
procrastine, on glande un peu à la faire, du coup si on est surveillé, on est
moins dispersé. Au contraire, si la tâche est complexe, surveiller quelqu'un va
simplement le ralentir, voir l'empêcher complètement de la réaliser.

Le mieux est simplement de demander de temps en temps où l'autre en est, mais
pas trop souvent.

## [Ringelmann effect][9] <a name="ringelmann"></a>

Sous ce nom compliqué se cache simplement l'effet de lourdeur hiérarchique. Plus un groupe est
gros, moins il est efficace car il faut gérer, en plus de la tache à exécuter,
l'overhead de la coordination du groupe. De plus, avec le grossissement d'un
groupe arrive aussi la dilution de la responsabilité.

Quand on est seul, si quelque chose ne marche pas, c'est forcément qu'on
a merdé. Même quand on est que 2 ou 3, on ne peut rebalancer la faute sur les
autres tout le temps. Par contre quand on commence à être nombreux, si quelque
chose foire, c'est jamais directement de notre faute, c'est un peu la faute de
tout le monde, du coup c'est la faute de personne. Et puis même si c'était de
votre faute, il y a peu de chance qu'on puisse remonter jusqu'à vous.

Ce genre d'ambiance plombe complètement la motivation, car de la même manière
que vous ne pouvez pas être blâmé, vous ne pouvez pas non plus être récompensé.
Si ce n'est la faute de personne quand ça foire, ce n'est grâce à personne non
plus quand ça réussit.

Les grands groupes aiment aussi les process, les cadres, les règles. On arrive
facilement et [paradoxalement][10] à de gros problèmes ou inadéquations ne
résultant que de l'application de petites étapes qui, prises individuellement,
ne montrent aucun souci en elle-mêmes. Sans réel coupable, ils peuvent aussi
perdurer d'autant plus longtemps.

Pour contrer ça, laissez de la liberté à chacun, limitez la hiérarchie au
maximum (3 couches MAX).

## Woozle effect <a name="woozle"></a>

Le principe de la rumeur. Comment les rumeurs et les légendes urbaines se
forment. Comment à force de répéter et d'entendre tout le temps les mêmes
fausses informations on fini par les assimiler comme des vérités et les répandre
nous-mêmes.

Vérifiez vos sources, attention aux "untel à dit ça", méfiez-vous des vérités
générales, entendre souvent la même chose ne veut pas dire que c'est vrai (ex:
la pub)...

Ou comme dit dans [HPMOR][11] (Harry Potter et les Méthodes de la Rationalité) :

> - "Que croyons-nous et pourquoi le croyons-nous ?"
> - "L'absence de preuve n'est pas une preuve d'absence."

## [Matthew effect][12] <a name="matthew"></a>

Si quelqu'un dans votre équipe est très compétent et qu'il est capable de faire
un certain nombre de tâches plus rapidement que n'importe qui d'autre, il y a de
fortes chances que vous alliez toujours le voir pour faire ces tâches.

Dans un premier temps, cette personne, exposée à davantage de problèmes et de solutions,
deviendra une ["Superstar"][13].

Mais dans une version plus perverse, cette personne finit par ne plus avoir le
temps de faire ses autres tâches, voire si vous êtes plusieurs à aller le voir,
il n'a même plus le temps de faire son travail du tout. Alors que pendant ce
temps tout le reste de l'équipe, on ne lui demande rien.

Dans ce cas, il faut faire faire monter en compétence et déléguer. Machin est
peut-être plus rapide, mais si vous l'étouffez à toujours venir le voir, il
finira par partir. Laissez Machin déléguer et apprendre aux autres, qui seront
certes moins rapides mais qui peuvent être plusieurs à exécuter ces tâches en
parallèle et vous désengorgez les process.

La solution n'est pas de virer ceux qui sont trop lents, et de ne garder que des
experts d'un domaine. À la place il faut faire monter tout le monde en
compétence sur tous les sujets, pour avoir une équipe pluri-disciplinaire.

C'est aussi plus facile pour gérer les maladies et les congés :)

## [Catfish effect][14] <a name="catfish"></a>

Celui-là, je le connaissais pas ! L'histoire veut qu'un groupe de pêcheurs en
haute mer revenait régulièrement au port avec de grosses cargaisons de sardines.
Mais après un si long voyage, leurs sardines n'étaient plus forcément très
fraîches. Et les sardines peu fraîches se vendaient moins cher que les sardines
fraîches.

Pourtant, il y avait toujours un bateau qui avait des sardines plus
fraîches. Son secret était qu'il gardait avec ses sardines un poisson-chat,
prédateur des sardies, ce qui les tenait en mouvement.

L'émulation d'avoir un plus gros poisson avec elles, la compétition pour ne pas
se faire manger les forçaient à rester alertes. Dans le monde du travail, cela
ne signifie pas de mettre un tueur sanguinaire au sein de votre open-space pour
motiver tout le monde. Non, l'idée est de mettre un "maestro", quelqu'un de plus
balaise dans l'équipe pour créer une émulation encore une fois faire monter en
compétence le reste de l'équipe autour de lui.

## [Attribution Error][15] <a name="attribution_error"></a>

- "Bidule qui est d'habitude toujours sympa, là il s'est vraiment comporté comme
  un salaud". 
- "Machin qui est d'habitude très con, là il a dit un truc super intelligent".

Ces deux phrases sont des exemples de l'attribution error. Méfiez-vous des
phrases qui contiennent _toujours_ ou _jamais_. Personne n'est toujours comme-ci
ou jamais comme-ça. Vous avez sans doute mis une étiquette sur une personne par
rapport à la manière dont elle s'est comportée la première fois que vous l'avez
rencontrée et vous avez continué à la voir de cette façon par la suite.

Oubliez vos a priori, regardez ce que font les gens maintenant, pas par rapport
à ce qu'ils ont fait avant.  Et surtout, ne jugez pas hâtivement, et essayez de
déchiffrer le contexte avant de parler.

## [Demo effect][16] <a name="demonstration"></a>

Pas l'effet Bonaldi, mais celui qui dit que quand on montre aux autres comment
faire, ils apprennent mieux que quand on leur dit comment faire. Surtout si la
tâche est chiante, il vaut mieux la faire une première fois avec la personne qui
va devoir la faire ensuite pour lui montrer et que ce ne soit pas toujours les
mêmes qui fassent les tâches rébarbatives.

## [Walkman effect][17] <a name="walkman"></a>

Celui-ci je ne suis pas sur que Sylvain n'ai pas inventé le nom _NdSAb : non pas
du tout ^^_. C'est le fait que les managers qui ne sont pas habitués
à travailler avec des développeurs puissent s'offusquer du fait que nous
travaillions avec notre casque rivé sur les oreilles, éloigné du monde
extérieur.

On fait ça pour pouvoir se concentrer, pour contrôler l'environnement dans
lequel on travaille, mais pour quelqu'un qui ne le sait pas, cela nous fait
passer pour des asociaux qui n'aiment pas les gens.

À nous d'expliquer et de faire comprendre pourquoi nous souhaitons "reprendre le
contrôle".

## Conclusion

Finalement, un talk passionnant, je vous invite à regarder et partager cette
vidéo.

# De l'UX dans mon équipe Agile <a name="ux_agile"></a>

Antoine Pezé, Octo Technology,  a ensuite parlé du rôle de l'UX designer dans
une équipe agile.

{% youtube https://www.youtube.com/watch?v=hqTCFzDj2l4 %}

Il a commence par rappeler que le rôle de l'UX designer n'est pas de dispenser
une checklist de bonnes pratiques aux développeurs car une telle liste n'existe
pas. Il faut à la place se mettre dans la peau des utilisateurs et créer un
outil qui réponde aux besoins de ces utilisateurs. Si ça ne réponds pas à leurs
besoins, c'est alors un échec.

Dans son ancien poste, il passait une majorité de son temps à créer des
maquettes qu'il livrait ensuite à un prestataire qui aller les intégrer pendant
deux mois, puis le site allait être mis en ligne. Sa part dans le projet
s'arrêtait donc très tôt.

Maintenant chez Octo son rôle est beaucoup plus important sur toute la durée de
vie du projet. Dans un projet agile il y a beaucoup de monde, avec différents
rôles, mais _ce qui est important, ce ne sont pas les gens, mais les flèches
entre les gens_ (j'ai beaucoup aimé cette phrase). L'UX designer va discuter
avec les développeurs, échanger avec eux et eux vont faire de même. Ainsi l'UX
designer va quand même pouvoir évangéliser un peu les développeurs
à l'ergonomie, et de son coté il va apprendre sous quel format les développeurs
préfèrent obtenir leurs livrables.

Dans un projet agile, l'UX designer est celui qui prends de l'avance, qui ouvre
les pistes. Il a une itération d'avance et va aider le PO à prendre des
décisions en fonctions des retours des utilisateurs sur le terrain. L'UX
designer
va régulièrement sur le terrain, pour rencontrer les utilisateurs et pouvoir
intégrer leurs retours dès les premières itérations, et continuer de le faire
régulièrement tout au long du projet.

Il donne l'exemple de la dernière appli sur laquelle il a travaillé, destinée
aux conducteurs de camion-citerne. C'est donc quelque chose de très spécifique
et on ne peut en comprendre tout le détail qu'en allant sur place, sur le
terrain.

Il a donc là bas appris très rapidement que les téléphones étaient interdits
dans le dépôt (c'est bête, c'est là où l'appli devait être utilisée), mais que
le mode avion était toléré. Du coup, l'équipe a pu prendre en compte dès le
début la création d'un mode offline et ne pas découvrir cette informations à la
dernière minute.

Idem, la boîte avait pour idée de créer un fil de news dans l'application pour
les employés, mais après retour sur le terrain, cela n'intéresse personne. Du
coup, la feature est mise de coté et l'équipe peut utiliser son temps pour faire
des choses plus utiles.

Le travail de l'UX designer quand il n'est pas sur le terrain avec les
utilisateurs est aussi sur le terrain avec les développeurs dans ce qu'il
appelle des war rooms. Là, ils se retrouvent cote à cote pendant quelques heures
pour améliorer l'intégration à coup de quickfix et de feedbacks. On change des
détails comme la couleur, le contraste, la taille, etc. Bien plus rapide de le
faire avec l'UX designer à coté pour valider que de devoir envoyer les
informations par mail.

Cette manière de travailler permet d'avoir des retours des utilisateurs non pas
à la toute fin du projet, mais dès le début, à chaque étape. Mettre son projet,
incomplet dans les mains d'un utilisateur c'est un peu comme mettre _ses trippes
sur la table_ (j'ai bien aimé celle-là aussi), se confronter au réel, aux vrais
utilisateurs, de voir comment les gens vont utiliser le soft pour de vrai.

![Users...][18]

C'est d'ailleurs très difficile de regarder quelqu'un se servir de son programme
et de galérer, de ne pas aller l'aider. Mais il faut le faire, voir comment ils
trouvent des chemins détournés, comment certaines choses qui nous semblent
évidentes passent inaperçues.


Et allez pour la fin, il avait beau nous dire qu'il n'y avait pas de checklist
d'UI, il a quand même donné le lien de [goodui.org][19].

# Wild Code School <a name="wild_code_school"></a>

Et pour le dernier talk c'est Romain Cœur qui nous a parlé de l'école
d'informatique qu'il a fondée. La Wild Code School est spéciale car elle se
trouve à La Loupe, un petit bled à la campagne à 1h30 de Paris entre Chartres et
le Mans.

{% youtube https://www.youtube.com/watch?v=_JxOriDFwbY %}

L'école vient de fêter sa première promo en Avril dernier et la prochaine va
débuter en Septembre. Elle propose une formation courte et intense (6 mois) au
développement web. C'est ambitieux (6 mois c'est court), mais elle est destinée
à des gens ambitieux aussi bien dans les profs que dans les élèves.

Romain nous a parlé un peu de son parcours. Ingénieur, il a fait 5 ans d'études
dans lesquelles il a appris plein de choses. Puis dans le milieu professionnel
il s'est rendu compte qu'il y avait globalement les ingénieurs qui sortaient de
grandes écoles et les autodidactes qui sortaient de nulle part, avec très peu
entre les deux. Il a aussi remarqué que toutes les écoles sont globalement
localisées à Paris alors que techniquement, le développement web ça peut se
pratiquer en remote sans avoir besoin d'être à Paris.

La première promo de l'école était la promo bêta et a ouvert ses portes à des
personnes de tout age (de 19 à 43 ans) et de tout horizon (serveur chez mac do,
assistante de direction, boulanger, menuisier, etc).

La formation est entièrement centrée sur la pratique, les élèves ont des projets
à réaliser dès la deuxième semaine. Ils n'ont presque pas de cours mais très
souvent des ateliers pratiques. En lieu et place des examens, ils ont des
hackathons avec des projets à rendre. Ils ont des ateliers organisés par des
professionnels de tous poils qui viennent leur parler autant d'Agile que de
communication corporelle ou d'API.

Ils ont aussi peu de professeurs, qui sont essentiellement des formateurs plus
que des enseignants. Ils ne sont pas là pour délivrer la connaissance aux
élèves, mais pour les accompagner dans leur formation et assurer la cohésion de
l'équipe. Un point important sur lequel il a appuyé était la dédramatisation de
l'échec. On est là pour apprendre, il est normal qu'on ne sache pas au début,
mais en faisant on finit par comprendre et dans le doute tout le monde est dispo
pour répondre aux questions.

Les élèves sont aussi très rapidement mis dans le bain car les différents
projets qu'ils ont à rendre sont des projets réels, qui partiront en production
pour les différentes entreprises de la région, et son facturés. Cela a un
multiple effet positif. D'une part les élèves voient qu'ils travaillent sur
quelque chose de concret, qui sera utilisé. Ils peuvent parler autour d'eux de
ce qu'ils font car les entreprises sont connues dans la régions. Et le maire de
La Loupe est très content d'avoir un pôle comme cela qui se développe.

Romain nous a ensuite mis en avant quelques temps forts de la première promo.
Eux aussi découvrent ce que c'est que de monter une école, et de devoir gérer un
groupe aux ages et ambitions différentes.

La différence d'age extrême entre certains élèves a parfois conduit à des mots
un peu fort, mais il faut apprendre à certains à chacun à s'exprimer d'une
manière qui ne blesse pas dans un contexte professionnel, et à d'autres
à accepter qu'une plus jeune génération ait d'autres opinions.

Tous les élèves n'avaient pas la même motivation. Certains sont venus pour
essayer mais se sont rendu compte rapidement que ce n'était pas pour eux,
d'autres se sont découverts une passions ou encore certains étaient sous
pression car cette formation était leur dernière chance de reconversion. Là
dedans, il faut réussir à garder le flow et l'harmonie de l'équipe.

Les formateurs se sont aussi rendu compte d'avoir fait une grosse erreur quand
ils ont organisé un examen noté. Plusieurs de leurs élèves étaient dégoutés du
système scolaire classique et ont vu la notation d'un examen comme une sanction
et leur note comme une attaque personnelle. Il a fallu travailler avec eux pour
leur montrer que la note est juste le reflet des éléments qu'il faut améliorer.
Mais ils ont quand même laissé tombé les notes pour la suite.

À l'issue de la première promo, 70% de leurs élèves ont trouvé un stage, un CDD
ou un CDI. La formation délivre surtout les bases et la distillation de la
curiosité. Les élèves sortent de là avec une envie d'apprendre et une forte
capacité d'adaptation. Les bases de l'algo sont encore fragiles et ils sont plus
portés sur la pratique que sur la théorie.

Pour les prochaines promos ils vont tenter d'améliorer ce coté là. Ils vont
aussi avoir une sélection à l'entrée un peu plus fine, pour voir la motivation
des gens. Beaucoup se disent que l'informatique ça peut être intéressant mais ne
se rendent pas compte de ce que signifie réellement coder. Pour ça, ils font une
première sélection sous forme de MOOC et ateliers pratiques pour essayer
d'exposer aux gens où ils vont mettre les pieds.

La première formation était entièrement gratuite, car projet pilote. La deuxième
est officiellement payante (6000€), mais avec les bourses données par la région,
la ville, les entreprises et l'école elle-même (sur les projets facturés) ils
garderont l'entrée gratuite pour les étudiants modestes.

Comme je le disais plus haut, le maire est très heureux de cette initiative et
aide l'école, en fournissant par exemple un internat pour les élèves. Cela
favorise l'emploi dans sa région et il souhaite fonder une pépinière
d'entreprises sur place.

Romain est resté volontairement évasif sur les technos enseignées car celle-ci
lui semblent secondaire face à la capacité d'apprentissage et d'adaptation que
ses élèves acquièrent. Néanmoins ils commencent par du HTML et du CSS et
choisissent ensuite pour la suite de la formation s'ils veulent faire du PHP,
Ruby ou Node (il y a même des élèves qui ont choisi de faire du Meteor). Les
élèves sont aussi force de proposition et certains ont proposés de tester
PhoneGap alors ils l'ont ajouté au cursus.

Une bien belle école, où on apprends les fondamentaux avant de se lancer dans le
monde du travail, tout en ayant aussi acquis la curiosité qui fait qu'on
continue d'apprendre régulièrement.

# Conclusion

Encore une bien belle session. Merci à Viadeo de nous avoir accueilli, on eu le
droit là à 4 talks passionnants.

[^why_socio]: le but de l'auteur est de vous donner les armes soit en tant que (jeune ou moins jeune) manager, soit en tant que dev pour avoir les mots et les faits qui permettront d'expliquer à votre manager vos demandes pour améliorer vos conditions de travail.

[^other_talks]: [Simon Guimezanes "Guide de la survie politique en entreprise"][20] [Sylvain Abélard "Let's build pyramids"][21]

[^career_tips]: mais c'est un autre débat -- ceux qui pourraient en parler exigeront soit beaucoup d'argent (c'est légitime vu les k€ que tu peux gagner, mais ça reste vous qui prenez les risques), soit de couper la caméra.

[^fixed_growth_mindsets]: Note de Sylvain Abélard : le "fixed mindset" dit que "vous avez un niveau d'intelligence fini, certains sont bêtes et d'autres plus ou moins intelligents. Le "growth mindset" dit que quel que soit le problème, on peut y arriver en travaillant davantage.  Le Fixed Mindset donne des gens qui progressent peu et pour l'avoir vécu je le trouve dangereux et nocif. Il est la raison de mes talks [Hack your Brain][22], [Hack your motivation][23] et [Dark Side][24] Pour en savoir plus : [https://en.wikipedia.org/wiki/Mindset#Fixed_mindset_and_growth_mindset]()

[^stepping_down]: hormis licenciement (difficile en France), changement de travail, mobilité interne... En tout cas changer de job tout court requiert de l'énergie et peu apprécient, surtout pour un poste moins "prestigieux socialement" ou à salaire moindre. Ceux qui savent bien négocier iront d'autant plus vite soit dans un poste très important où ils sont très incompétents (sans que cela ne se voie) soit dans un poste où ils maximisent leur propre bonheur, lequel est souvent défini par [Autonomy, Mastery and Purpose][25] (Autonomie, Maîtrise, Objectif / Vision).

[^dumb_sure]: Ajoutez à cela l'effet classique qu'en réunion comme dans tout contexte social, il est facile pour un extraverti d'imposer son point de vue ; que beaucoup de développeurs sont introvertis, et vous avez un mix explosif. En tant que "celui qui fait", il est alors de votre devoir d'améliorer vos skills sociaux en entreprise et lors des réunions !


[1]: https://twitter.com/abelar_s
[2]: https://github.com/pixelastic/meetups.pixelastic.com/pull/1
[3]: https://twitter.com/ypasteur
[4]: https://fr.wikipedia.org/wiki/Principe_de_Peter
[5]: https://en.wikipedia.org/wiki/Dunning%E2%80%93Kruger_effect
[6]: https://fr.wikipedia.org/wiki/Effet_Hawthorne
[7]: http://www.perlmonks.org/?node_id=542341
[8]: https://en.wikipedia.org/wiki/Audience_effect
[9]: https://en.wikipedia.org/wiki/Ringelmann_effect
[10]: http://thecodelesscode.com/case/164?lang=fr&trans=abelards
[11]: http://hpmor.com
[12]: https://en.wikipedia.org/wiki/Matthew_effect
[13]: https://fr.wikipedia.org/wiki/Effet_superstar
[14]: https://en.wikipedia.org/wiki/Catfish_effect
[15]: https://en.wikipedia.org/wiki/Fundamental_attribution_error
[16]: https://en.wikipedia.org/wiki/Demonstration_effect
[17]: https://en.wikipedia.org/wiki/Walkman_effect
[18]: /img/2015-06-09/users.jpg
[19]: http://www.goodui.org/
[20]: http://vimeo.com/72344243
[21]: https://speakerdeck.com/abelar_s/lets-build-pyramids
[22]: https://speakerdeck.com/abelar_s/hack-your-brain-fr
[23]: https://speakerdeck.com/abelar_s/hack-your-motivation
[24]: https://speakerdeck.com/abelar_s/hack-your-brain-iii-the-dark-side
[25]: https://duckduckgo.com/?q=Autonomy%2C+Mastery+and+Purpose
