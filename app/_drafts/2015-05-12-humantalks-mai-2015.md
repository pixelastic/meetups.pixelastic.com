---
layout: post
title: "HumanTalks Mai 2015"
tags: humantalks
---

Ce mois-ci, les HumanTalks étaient chez Deezer, dans leur belle grande salle du
rez-de-chaussé. Un beau frigo rempli nous fait de l'œil, le buffet va être bien.

Petite soirée des fails malgré tout. Déjà le projecteur refuse de projeter les
slides de la présentation, l'un des speakers nous fait faux bond, les pizzas
arrivent un peu tard, et la clim ne marche pas assez bien.

Malgré tout, on a eu le droit à 4 présentations, avec Mickael Andrieu qui nous
a fait une présentation impromptue pour nous faire patienter avant l'arrivée des
pizzas.

## Github Awards, découvrez votre ranking

https://www.youtube.com/watch?v=vrxW9ae-7UE

Vincent Daubry. Co-fondateur Youboox, Ruby/iOS.

Side projects, simple, pas de temps, fun. @SachaGreif.

2 semaines, soir et week-end, ne se lasse pas. Voir où on se trouve sur github
en fonction des differents rankings. Ca l'a daitr marer, c'est suffisant?

Déjà on liste tous les users et ler location. Ensuite on liste tous les repos
avec les langages e les starts. on géocode les locations, et on peut ensuite
faire du rankins.

api github bien ouverte, mais énorme. 5000 appels/h par apikey. Mais autre API
"bulk" mais juste résumé. pas de location, stars, etc.

githubarchive, ensemble des events des repos publics depuis 2011, ensemble de
comments, PR, clone, etc. Mais requetable sur google big query
devient quelues gigas, on peut monter ça en mémoire en REDIS.

HN 2e page, ProductHunt.

200m visiteurs, 15% des utilisateurs de github.

Conclusion, ne laissez pas vos side projets trainer, sortez-les.

## Licences open-sources

https://www.youtube.com/watch?v=j2n6MargPj8

0. liberté d'executer le programme pour tous les usages
1. liberté d'étudier et de l'adapter
2. liberté de redistribuer
3. liberté d'améliorer et de publier ses améliorations

libre ≠ Open Source ?

Open Source Initiative. Entreprise, pragmatique.
"Libre", si patch, doit tout refournir comme un seul tas. Dès qu'on ajoute du
libre dans du proprio, tout devient libre.
Open Source ne contamine pas le reste.

Simple et permissif : distribution, patchs, github => MIT
précocuppé par les brevets, protection contre les propriétaires => Apache
favrosier le partage => GPL

www.choisirunelicence.com

## BA-BA du scrapping

http://www.slideshare.net/AlexandreGindre/le-baba-du-web-scraping
https://www.youtube.com/watch?v=45EurjpgqhI

Alexandre Gindre, Octo Technology. (@alexgindre)
Disclaimer, pas fait chez Octo mais sur side projects ou avant.

Scraping ≠ Crawling.
Crawling on prends tout. Scrapping, on extrait les infos précises.

Site cible, (derrière un proxy), un outil scraper, ensuite on stocke et on
le retraite dans un autre contexte.

Légal ? C'est flou. Droit d'auteur et droit sur les bases de données. Si sur
site, appartient à l'auteur. Mais jurisprudence de Opodo contre Ryanair, mais
Opodo a gagné car n'a pas causé de tort.
Charte de societe.com indique que c'est interdir de scrapper. Mais reste flou si
ça a une valeur légale.
Attention à ne pas mettre en péril la plateforme, DDOS, car releve du pénal.

PriceWiki, scrappe le cout de la vie dans différents pays.
Rapportive extrait linkedin + photos + mails.
GetHuman retrouve les emails des gens dans les sites.
Parsely, innerballons, gov.co.uk

outils
Kimonolabs, Import.io, services en saas en GUI pour scrapper n'importe quoi.

frameworks
Scrapy, ScrapingHub pour heberger, gerer la fréquence, prendre plein d'ips
différentes.

Tor + Squid + Polipo pour anonymiser.
Libs de parsing HTML bas niveau ne gèrent pas les erreurs HTTP, ni gèrent pas
les tags malformés.

hidemyass pour changer son ip
watcher pour regarder les pages avec un requete HEAD


## BackBee

Next-Gen Content Manager

CMS orienté gestion de contenu. fondé sur composants Symfony et Doctrine.
Gestion de contenu extensible, tout en GUI point'n'click.

Templating, API REST, 
client js en front distinct du projet back
edit in place ?

HttpKernel, HttpFoundation, event dispatcher, dependency injection
requete <=> réponse

...perdu...

définition en yaml





## Informatique en milieu hospitalier

???

