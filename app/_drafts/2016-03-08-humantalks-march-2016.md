---
layout: post
title: "HumanTalks March 2016"
tags: humantalks
---

Viadeo, greve

## Owasp Zap

secu fun

Paul Molin, Theodo

dev agile, mets en prod toutes le ssemaines
pas possible en général avec la secu
audit de un mois ou deux avec contr audit

comment on fait?
trouver les failles soi même
zap open web application project
donne des applus vulnérable pour s'entrainer
documentation
outils

zap, idéal pour débutants
mais utilisé par professionel, récompensé

proxy entre navigateur et serveur
modifier les requetes
vérifie les protections qui sont coté client mais pas serveur
scan ce qu'il se passe, d emanière passive
on peut lancer du spiderin, pour crawle tous les liens, etc e completer le
contenu caché
detecte des faills d ebuffer overflow, xss, sql

demo, visite pas, trouve des liens avec le proxy, puis lane un sidering pour
trouver toutes les pages
ensuite, balayage avancé, sur toutes les pages trouvées
trouve des erreurs et les range par criticité, avec lien vers explication et
page cible

peut marquer des bouts de page comme étant non identifé
spécifie la page de login, et comment se conncter, avec un bon login/pass
puis teste toutes les pages pour vérifier que bien loggué

illégale si pas autorisation
donc à le faire chez soi, sinon quelqu'un d'autre le fera
