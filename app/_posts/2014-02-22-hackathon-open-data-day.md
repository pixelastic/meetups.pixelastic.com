---
layout: post
title: Hackathon OpenData Day 2014
tags: hackathon
---
Le 22 Février est la journée mondiale de l'Open Data, et avait lieu à Paris un
Hackathon, dans les locaux de Simplon, à Montreuil. Autant le dire tout de
suite, c'était mal organisé. On était à peine douze en tout, en comptant les
journalistes et les organisateurs.

Chacun a un peu présenté ce qu'il souhaitait faire et on s'est globalement
répartis en 3 groupes : Open Data Ministère de l'Intérieur, Open Data Science
et Santé, et Open Street Map.

De mon coté j'ai bossé avec Sabine Blanc, journaliste qui s'interesse à l'Open
Data du Ministère de l'Intérieur. Le ministère a "ouvert" 266 jeux de données,
mais dans des formats pas forcément exploitables (pdf, word, xls). Elle
souhaitait les ouvrir tous pour en voir le pourcentage qui étaient réellement
exploitables de manière à pouvoir dire si le travail du ministère en terme
d'ouverture est atteint ou non.

Comme c'est chiant de faire ça à la main, je me suis proposé pour scripter un
scrapper qui va automatiquement pré-remplir un Google Spreadsheet avec les
infos interessantes et les liens pour télécharger et où il ne reste plus qu'à
indiquer si oui ou non le fichier est utilisable.

Heureusement, il y avait parmis les participants Emmanuel Raviart d'Etalab, qui
a bossé sur le site data.gouv.fr d'où je choppais mes infos. Grâce à lui je
n'ai pas eu besoin de scrapper les pages comme un bourrin car il existe une API
(en fait, il en existe 3), non documentée, qui permet de faire ce dont j'avais
besoin.

En une aprem j'ai réussi à récupérer 55 jeux de donnée sur les 266 (pour cause
de bug dans l'api, les jeux manquants étaient impossible à requeter).
Heureusement, Emmanuel a pu me filer des liens vers les bons endpoint de l'API
et j'ai pu finir le travail ce week-end et générer le fichier final.

Sur place on a pu rencontrer quelques personnes sympas, mais globalement
c'était pas le hackathon qui restera le plus dans ma mémoire. Les gens
partaient petit à petit sans qu'il n'y ai de présentation finale des travaux de
chacun. Et puis un hackathon de 13h à 19h ça fait un peu court.

Le code que j'ai pondu est dispo ici
: [https://github.com/pixelastic/datagouv-scrapper]() et permet de récupérer sous
format csv et json la liste des jeux de données fournis par un ministère donné.

