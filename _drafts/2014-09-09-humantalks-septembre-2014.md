---
layout: post
title: "HumanTalks Septembre 2014"
tags: humantalks
---

Chez Mozilla. 4 talks.


## TDD is not really dead
Nicolas Mérouze.
http://nicolasmerouze.com/

"TDD is dead", c'est mieux de faire des tests d'acceptance.
Exemple en go (pas forcément lisible).

Acceptane, test en black box. Mais (est pas du BDD. En BDD, on fait aussi du
TDD, là on ne fait que du test d'acceptance.
Redondance entre Unitaire et Acceptance si code est simple.
Mutualiser les tests en définisant une "table de données", pour faire passer le
même test avec différents inputs et outputs attendues.

Acceptance devient trop générique, on ne peut pas tetster toute la logique aec
tous les cas paerticuliers, attributs, etc.

Et comment on mock ? On peut pas en Black Box. Du coup, on refait des tests
unitaires. Donc, White-Box testing, on mock nos méthodes.

100% de couverture, on test ce que l'utilisateur veut, et on reste confiant
dans ses tests. Acceptance first, TU ensuite si vraiment on ena  besoin. Donc
gain de temps.

Pour de l'UI, du graphique on peut devoir faire les tests d'accaptance après le
code.


## Commando
Evan Genieur
@CodersInBlack

Arreter de bosser avec de sslariés, uniquement des passionés. Bons produits
faits par des gens passionés. Bosser dans des endroits géniaux. Voir des
horizons. Combiné sur 4 jours.

Créer une bulle d'efficience efficacité. Donner le maximum de potentiel au
projet en étant focus dessus et faire un livrable dans les temps type
hackatjon.

Run de 3 jours de commandaire. Et une journée d ebrief/debrief.
Une itération du projet avec un expert et un porteur de projet. Pas forcément
fini, mais en faire le plus en une itération.

23 runs, 13 endroits, 10 personnes, 5 porteurs de projets.

2 jours trop court, 5 trop long. No Bullshit, tout le monde doit faire bien son
job. En moyenne, une journée pas efficace. Vit et travail au même endroit. Full
focus. In the zone. MOment unique.

Facile à planifier, 34 jours ça se gere facilement.

Prototype, 5 runs. App 12 runs. Au dela, trop.
Padawan 3a, Jedi 5a, Yoda, 10a. mélange des trois. Padawan passage de
compétence au client, jedi refactor, yoda, assure le run.

Proto ~4000€. Air BnB.


## RxJava
Brice Dutheil / David Wursteisen

RxJava implmémentation java des reactive extension. à la base micorosft, pius
opensource. puis pris par netflix et passé en RxJava.

Dystèmes distribués avec plusieurs coeurs un peuit partout. Tout ces systmes
doicent communiquer entre eux sur INternet ou entre CPUs. Communication par
evenement.

RxJava fournit une abstraction élégante et composable, felxible et puisante. On
manipuple des séquences d'venements. Quelque soit la source, réseau, caclul
interaction UI de l'utilisateur. ON veut réagor sur ces évenemnts (function).
Définir des erreurs sur les events.


bservavle d'un list, on peput filtrer et faire une methods sur ce qui reste.
filter, map, merge.

Rx Synchrone par défaut.
