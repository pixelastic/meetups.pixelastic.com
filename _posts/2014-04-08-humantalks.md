---
layout: post
title: HumanTalks Avril 2014
---

## Introduction

La session avait lieu chez Mobiskill, 43 rue Beaubourg. Ils sont "experts dans
le recrutement mobile et web".

## Aggregation pipeline pour mongoDB

Aggregation pipeline est un framework intégré à mongodb depuis la 2.2. Il
permet de chainer des opérations de find sous forme de pipe, un peu à ma
manière d'un map/reduce.

- $match permet de retrouver des éléments qui matchent un certains selecteur
- $project permet de définir la liste de champs à garder, exclure ou renommer
- $unwind pour applatir le résultat
- $group pour... grouper les résultats par critères
- $sort pour les trier

En pratique, on utilise tout ces selecteurs chainés en pipe, plusieurs fois les
mêmes, pour arriver à un résultat filtré sur mesure.

Ca reste du mongo, donc il n'y a toujours pas de jointure. Il y a des types de
valeurs qui ne sont pas traitable (int, float, string et autres types de bases
sont parfaitement traités). Et une autre limitation inhérente à mongo est que
les flux ne doivent pas dépasser 16Mo (limite en dur dans mongo).

La speakeuse indiquait que l'implémentation était facile, plus aisée à prendre
en main que map/reduce, et qu'il y avait encore plus d'opérateurs que ceux
présentés.

Ca supporte officiellement les collections shardées mais il vaut mieux avoir
une machine bien puissante pour que ça fonctionne correctement.

## Programatoo

Initiative de deux développeuses de chez Sfeir qui aiment l'informatique depuis
qu'elles sont petites mais n'ont jamais trouvé dans les cursus nationaux de
quoi satisfaire leur demande. L'informatique à l'école se limite à du
Word/Excel ou alors englobe trop de choses sous le label "multimédia" ("C'était
le buzzword il y a 10 ans, aujourd'hui c'est BigData").

Ont organisé un "coding gouter" avec les enfants des employés Sfeir, et les
plus jeunes ont beaucoup aimé, mais les plus vieux (12-15 ans) se pensaient
déjà au dessus de ça, que "l'informatique, ils maitrisent". En fait, ils
connaissent youtube et facebook mais ça ne va pas plus loin.

Elles ont donc proposé des cours d'informatiques pour jeunes dans différentes
écoles et font aujourd'hui ça à Nanterre, pour transmettre leur passion et
remettre à jour les définitions des conseillères d'orientation sur le métier de
"Développeur".

Les langages utilisés sont Scratch, SmallBasic et Kids Ruby (par ordre
croissant de difficulté). D'autres initiatives du même genre existent aussi
: CoderDojo, KCC, je.code(), Devoxx4Kids.

Elles ont remarqué qu'il y avait beaucoup plus de réticence à apprendre l'outil
informatique de la part des enseignants (à qui cela fait peur) qu'aux enfants.

## Programmation par contrats

Jean Baylon de Soat nous a parlé de programmation par contrat. C'est un type de
programmation défensive où on spécifie dans le code ce qu'on attends comme
input (pre-conditions) et comme output (post-conditions).

Ca permet d'éviter les commentaires (qui ont peu de valeur et sont souvent
oubliés dans le refactoring), et s'utilise en parallelle de tests unitaires.

Par exemple, si on veut implémenter une fonction de racine carrée, on testera
l'input pour s'assurer qu'il est positif (comme ça on s'assure, dans le code
même de la méthode que les inputs négatifs ne donneront rien). Mais on teste
aussi le retour de la méthode avant de le retourner, dans cet exemple en
vérifiant qu'en multipliant le retour par lui-même, on retrouve bien l'input
initial.

Il existe des frameworks pour Java, Python, .NET et C. Ca permet de faire des
preuves formelles que le code est juste, un genre de try/catch amélioré.

Quelques exemples étaient donnés pour mieux comprendre le systeme. Si on
souhaite implémenter une Liste, on vérifie dans le constructeur que l'objet
retourné à a bien une length de 0. Quand on ajoute un élément, on vérifie avant
la sortie que la nouvelle liste a une length supérieure à la length initiale,
et on vérifie que le dernier élément est bien celui passé en input et que le
reste de la liste est égal à la liste initiale. Par contre pour la méthode qui
permet de récupérer un élément dans une liste on aimerait vérifier que
l'élément retourné était bien dans la liste initiale, mais on ne peut pas
vérifier cela car ça nous ferait partir dans une boucle infinie de récursion.

Ca pompe un peu sur les performances, mais la majorité des frameworks possèdent
un switch qui permet de désactiver les contrats en prod. On les laisse donc en
pre-prod, qu'on fait tourner pendant quelques temps avec de vraies données et
qui nous permet de catcher les problèmes, puis on désactive pour la prod.

Ca peut être utilisé aussi quand on développe une bibliothèque qui sera
utilisée par des tiers. On ne sait jamais comment les autres vont appeller les
méthodes, s'ils vont suivre la doc, etc. On peut comme ça générer des warnings
quand les paramètres sont mal passés et donner des indications sur la bonne
manière de faire l'appel. Ca permet une "découverte" de la libraire plus
facilement.

La programmation par contrat est à la fois un ensemble d'outils et une rigueur
dans le développement. C'est proche des TU dans l'esprit mais ça diffère
essentiellement au niveau du refactoring. Il est très simple de refactorer un
code testé, il est plus long de refactoré un code avec des contrats car les
contrats sont assez liés à l'implémentation. Refactorer le code peut induire de
modifier grandement les contrats. Par contre, si le refactoring consiste
"simplement" à déplacer des méthodes d'une classe à une autre sans modifier le
code interne, les contrats permettent de le faire très facilement car tous les
inputs/outputs sont testés au sein même de la méthode.


