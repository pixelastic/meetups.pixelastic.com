---
layout: post
title: "Formation HumanCoders Test Ruby on Rails"
tags: humancoders
---

Lors de mes premiers jours à [Octo][1], j'ai eu la chance de me voir offrir une
formation HumanCoders. [JVE][2] avait en effet gagné cette formation en
retweetant une annonce des [HumanCoders][3] et ne pouvant pas y aller, il
m'avait filé sa place.

Débutant en [Rails][4] et n'ayant jamais fait de tests, c'est exactement ce
qu'il me fallait et ce que je voulais apprendre. La formation a donc eu lieu sur
deux jours, dans un sympathique petit appart loué sur AirBnB à coté de
République.

Nous étions trois élèves en tout pour un formateur ([Jean-Michel Garnier][5]) et
[Matthieu Segret][6] qui restait dans un coin pour suivre aussi la formation.

![la solution][7]

Jean-Michel fait normalement cette formation sur une journée, du coup en
l'étendant sur deux on avait un peu plus le temps de poser quelques questions et
de tester plus profondément certaines parties. La formation était dédiée à des
gens qui connaissent bien Rails mais qui n'ont jamais posés de tests, j'étais un
peu plus largué que les deux autres, mais ayant déjà un background de
[cakePHP][8], je n'étais pas trop perdu dans les concepts.

## Types de tests

On a déjà vu les différents types de tests et les noms qui leur sont donnés,
pour s'y repérer un peu.

- Tests unitaires, ou TU, où on va tester unitairement une classe, en l'isolant
  complètement de ses dépendances.
- Tests d'intégration, où on va tester une classe et ses dépendances
- Tests d'Acceptance, où on va tester un scénario utilisateur complet, avec
  toute la stack depuis le browser jusque la base de donnée.

Petit rappel sur les qualités d'un bon test: lisible, petit, indépendant, sans
copié-collé et rapide. Tout ça permet de substituer les tests à la
documentations, pouvoir les lancer dans le désordre pour le même résultat, avoir
un feedback rapide et pouvoir en ajouter facilement.

On nous présente aussi rapidement le principe du TDD et des baby steps. Red,
Green, Refactor. Mais on nous prévient que c'est un peu le Graal des tests et
qu'avant d'en arriver là il faut déjà bien comprendre comment s'écrivent des
tests. Mais qu'une fois qu'on y arrive, c'est bonheur.

## Rspec

[Rspec][9] est le framework de TU de Rails. Il peut être utilisé à part aussi
sur d'autres projets, mais il s'avère que c'est celui utilisé par Rails. Il
y a plein de super magie made in Ruby dans sa syntaxe qui permettent d'écrire
des tests qui soient très lisible. Son API a pas mal changée par le passé et
évolue encore, mais à l'heure où j'écris ses lignes (2015, soit 2 ans après
avoir fait la formation), l'API de la v3 devrait être stable.

Un test Rspec, ça ressemble à ça

```ruby
describe "Class" do
  it "has feature" do
  end
end
```

`describe` et `it` permettent de découper les tests en blocks. `describe` est
utiliser comme wrapper pour grouper plusieurs tests ensemble. On groupe
généralement par classe, et/ou par méthode selon la complexité des tests. Les
`describe` peuvent s'imbriquer sans problème.

Les `it` représentent nos tests. À noter qu'on peut utiliser `fdescribe` et
`fit` pour _focus_ sur un seul `describe` ou un seul `it` et donc n'exécuter que
celui-ci dans la suite de tests.

Il existe une convention partagée dans le nommage des variables dans les tests.
On nomme en général `expected` la valeur qu'on attends et `actual` la valeur
qu'on génère. Et on vérifie bien souvent que `actual` est égal à `expected`.

À noter que `eq`, `eql` et `equal` ont des comportements différents. Il n'y
a rien là de spécifique à Rspec, c'est simplement du Ruby, mais un cas un peu
particulier.

`a.should eq(b)` est identique à `a.should == b`. On teste si la valeur est
identique, mais `a` et `b` peuvent avoir des types différents.

`a.should eql(b)` teste que la valeur __et__ le type soient identiques

`a.should equal(b)` quand à lui vérifie que `a` et `b` référencent carrément le
même objet.

Rspec expose une syntaxe très proche de l'anglais, à base de `should` et
`should_not`, ce qui rends les tests très facile à lire et donc très facile
à comprendre. En pratique c'est plus facile à lire qu'à écrire car on ne sait
jamais trop où placer les `_` au début (`should_not raise_error` et pas
`should_not_raise error`). Il faut un peu de compréhension des rouages internes
pour deviner la séparation.

## Tips Rspec

Jean-Michel nous a donné quelques tips appris à force de travailler avec Rspec.

Il est possible de définir un `subject` de nos tests, qui deviendra le sujet par
défaut des comparaisons.

```ruby
subject { 18 }
it  {  should  >  15  }
it  {  should  be  >  15  }
it  {  should_not  be  =  19  } 
```

Il nous conseille aussi d'utiliser le matcher `match_array` plutôt que `include`
car son output donne plus d'informations sur les différences en cas d'échec
(quelles clés sont communes, lesquelles sont différentes).

`let` permet de définir une variable dont l'initialisation ne sera exécutée que
la première fois que la variable sera utilisée, et qui retournera toujours la
même valeur pour un même block. On l'a rapidement abordé théoriquement dans la
formation, mais on ne l'a pas utilisé ensuite en pratique dans la formation.

Les callbacks `before(:each)`, `before(:all)`, `after(:each)` et `after(:all)`
permettent de simplifier les tests en ajoutant un peu de boilerplate avant et
après chaque test.

En passant `--order` à `rspec` on le force à exécuter les tests de manière
aléatoire, nous assurant donc qu'ils soient indépendants. De même, ajouter
`--backtrace` permet d'avoir plus de contexte sur là où les tests fails, ce qui
est bien utile pour le debug.

Des gems comme [timecop][10] ou [delorean][11] permettent de joueur finement
avec la notion de temps et de mocker des dates.

## WTF Rspec ‽

On a eu un petit moment WTF dans la formation quand la syntaxe un peu magique
s'est retournée contre nous.

Le code suivant marchait parfaitement, failant quand l'erreur n'était pas du bon
type.

```ruby
expect { Object.new.foo }.to raise_error { |error|
	error.should be_a(NameError)
}
```

Alors que celui-ci, censé être équivalent, laissait passer toutes les erreurs,
même celles de mauvais types.

```ruby
expect {Object.new.foo}.to raise_error do |error|
	error.shoul be_a(NameError)
end
```

Le problème semble venir de l'absence de parenthèses autour du `raise_error` qui
gène RSpec dans la compréhension du contexte. Pour info, voici le code corrigé
qui passe comme prévu :

```ruby
expect {Object.new.foo}.to(raise_error) do |error|
	error.shoul be_a(NameError)
end
```

Du coup, ça nous a bien montré l'intérêt de toujours commencer par un test qui
foire, pour être sur que nos tests testent bien les bonnes choses et pas du
vide. Avoir des tests qui passent toujours est bien pire que de ne pas avoir de
tests du tout.

## Outils

Les tests RSpec d'une appli Rails sont quand même assez lents car ils doivent
instancier la totalité de l'appli à chaque fois. Et la force des tests c'est
quand même d'avoir un feedback rapide. Et si on doit attendre 20s avant d'avoir
le résultat, c'est beaucoup trop long.

Pour contrer ça il existe des outils comme [Spork][12], [Spring][13] ou
[Zeus][14]. Après avoir utilisé longuement les trois, Jean-Michel nous
a conseillé Zeus. Il suffit de lancer Zeus dans un terminal, puis dans un autre
`zeus rspec /path/to/file.rb` pour lancer des tests qui utilisent la même
version de l'appli gardée en mémoire par zeus.

Sur ma machine, mes tests qui s'exécutaient en 7s sont passés à 0.2s.
Impressionnant. Attention toutefois, zeus n'est pas bulletproof et nécessite
parfois d'être killé et relancé car il ne parvient pas régénérer toutes les
modifications de code (notamment l'update du `Gemfile`, les fichiers d'i18n,
etc). Idem, il faut un workaround non expliqué ici pour réussir à le faire
fonctionner avec le mode random de `rspec`.

On a aussi rapidement survolé [Guard][15], [SimpleCov][16] et [Travis][17].

## Cas pratiques

La question a été posée de la redondance de code entre les règles de validation
du modèle qu'on pose en Rails et les tests de validation qui vont avec. Est-ce
utilise d'avoir cette info deux fois, et si non, alors lequel garder ?

Jean-Michel nous a suggéré d'utiliser la gem [schema_validation][18] qui va
générer automatiquement les règles de validation en fonction du schema de la
base de donnée. Du coup, c'est la DB qui est la source du schéma.

Par défaut, RSpec efface la DB de test après les tests, ce qui est assez
embêtant pour débugguer et traquer les bugs. Pour contrer cela, il est possible
de définir `use_transactional_fixture` et d'ajouter un clean de la DB avant
tous les tests, puis entre chaque test, mais pas après tous, pour pouvoir
étudier la DB à loisir. Il est aussi possible de définir quelles tables vider et
lesquelles garder (inutile de supprimer toute l'immense table d'i18n à chaque
test).

Il est aussi possible d'utiliser la gem [rspec-set][19] qui permet de définir
certains objets en DB qui reviendront toujours au même état entre chaque tests,
même après des update et des delete.

On a aussi été mis en garde de ne pas faire des tests sur la DB avec des volumes
très différents de ceux de production. Des problèmes peuvent survenir si les
données sont tellement importantes que la DB devient un bottleneck. Pour ça, il
est intéressant de posséder un dump d'une DB de prod (anonymisé bien sur) pour
faire des tests sur des données réelles.

## Tester une API

RSpec permet aussi de tester une API, mais ne fait pas réellement appel à la
couche réseau. À la place, il se pluggue sur les routes qui ont été définies
dans Rails. L'avantage c'est que c'est très rapide, l'inconvénient c'est qu'on
ne teste pas réellement en conditions réelles.

Au passage, si son API est bien définie, il est possible de générer
automatiquement sa documentation avec la gem [rspec_api_documentation][20] qui
créé alors automatiquement les tests avec les endpoints, les arguments attendus
et quelques exemples de réponse. Ces tests peuvent très facilement servir de
documentation.

## Tests Full Stack

Les tests d'Acceptance, ou full stack, vont tester l'ensemble de l'application,
depuis le point de vue de l'utilisateur. C'est à dire qu'on va tester le
navigateur, la couche réseau, les appels au back-end et les mises à jour en base
de données.

Ces tests sont très lent à jouer, et très long à écrire. Ils sont aussi sujets
à beaucoup d'erreurs et sont très fragiles (la moindre modification à n'importe
quel étage de la chaine peut faire foirer le test).

Pour les faire, on utilise [Selenium][21], qui est un driver pour piloter un
navigateur. On peut aussi utiliser un service en SaaS comme [Saucelabs][22] pour
le faire à notre place.

Si on veut le faire nous-mêmes, c'est [Capybara][23] qu'on utilise. Celui-ci
dispose de méthodes simples pour simuler un comportement utilisateur comme
`visit`, `fill_in` ou `click_on`. On peut alors tester des scénarios entiers de
remplissage de formulaire et tester qu'une phrase spécifique est alors bien
affichée à l'écran. On peut aller plus loin et tester que le record est bien
arrivé dans la base de données, mais on teste plutôt généralement que la page
qui affiche les records comprends bien celui que l'on vient de rentrer.

Le debug de tests Capybara se fait encore pas mal manuellement à l'aide de la
méthode `save_and_open_page` qui ouvre alors la page en cours dans un navigateur
pour que l'on puisse inspecter ce qu'il se passe.

Au final, ce sont des tests très fragiles car très dépendants du markup et du
wording. Il n'est pas certain que le temps investi sur ces tests soit
rentabilisé, il vaut mieux donc le garder pour les chemins critiques.

## Doubles, Stubs, Mocks, etc

On a gardé le meilleur pour la fin. On a eu le droit à une explication sur la
différence entre un stub et un mock.

En gros un double est un terme général pour parler des stubs et des mocks. Un
double est comme une doublure au cinéma. On dirait que c'est le vrai objet, mais
en fait c'est un faux. Il ne fait rien d'intéressant, à part répondre aux
méthodes qu'on appelle sur lui.

On peut en créer facilement avec Rspec comme ceci `double('name', method1:
response1, method2: response2)`.

On peut aussi créer un stub depuis un objet existant en court-circuitant une des
ses méthodes et en hard codant ce qu'il doit retourner. Cela permet par exemple
d'éviter des appels couteux en temps vers une API.

Attention toutefois, il est tellement facile de créer des stubs qu'il peut être
tentant de stubber un module complet et ses dépendances. Trop de stubs dans un
test est un gros code smell. Cela signifie que le code est trop couplé. Il vaut
mieux le séparer en plusieurs entités qui sont testables individuellement.

Les mocks de leur coté sont des stubs améliorés. On court-circuite toujours
l'appel initial à la méthode pour retourner une réponse sur mesure, mais en plus
on peut tester le nombre de fois qu'une méthode a été appelée et avec quels
arguments.

On a aussi abordé rapidement les fake objects et les spy objects, mais bien trop
rapidement pour que je puisse me souvenir de leur utilité.

# Conclusion

J'ai appris beaucoup en deux jours de formation, ça m'a permis d'avoir une
vision générale de ce que sont les tests exactement. Il y a beaucoup de nouvelle
terminologie et beaucoup d'outils à utiliser.

Je ne me suis pas mis à ajouter des tests tout de suite après la formation,
surtout que je n'ai pas fait de rails, mais les concepts m'ont permis de monter
rapidement la même chose sur une stack JavaScript. Et aujourd'hui, 2 ans après,
j'écris mon premier plugin testé avec RSpec et je me rends compte que cette
formation m'a vraiment aidé à y voir clair.

S'il y a un bouquin que je peux vous conseiller aussi c'est _Practical
Object-Oriented Design in Ruby_ par _Sandy Metz_. Du très beau clean code,
des patterns clairs, des exemples de séparation of concern très imagés. Chaque
phrase de chaque page est bien pensée, il faut le lire à tête reposée mais il
expose vraiment les choses clairement.

Et sinon aussi, en vrac, plein de liens que j'avais noté pendant la formation.

- [http://blog.mattwynne.net/2013/11/18/costs-and-benefits-of-test-automation/](http://blog.mattwynne.net/2013/11/18/costs-and-benefits-of-test-automation/)
- [http://stackoverflow.com/questions/11006888/testing-how-to-focus-on-behavior-instead-of-implementation-without-losing-speed/11023669#11023669](http://stackoverflow.com/questions/11006888/testing-how-to-focus-on-behavior-instead-of-implementation-without-losing-speed/11023669#11023669)
- [http://www.poodr.com/](http://www.poodr.com/)
- [http://blog.jonasbandi.net/2011/08/test-driven-it-is-mindset-not-tool.html](http://blog.jonasbandi.net/2011/08/test-driven-it-is-mindset-not-tool.html)
- [http://robots.thoughtbot.com/lets-not](http://robots.thoughtbot.com/lets-not)
- [http://parlonsruby.com/pr002-guard-avec-thibaud-guillaume-gentil-et-remy-coutable/](http://parlonsruby.com/pr002-guard-avec-thibaud-guillaume-gentil-et-remy-coutable/)
- [http://www.fastrailstests.com/](http://www.fastrailstests.com/)
- [http://bjeanes.com/2012/02/factories-breed-complexity](http://bjeanes.com/2012/02/factories-breed-complexity)
- [https://github.com/zipmark/rspec_api_documentation](https://github.com/zipmark/rspec_api_documentation)
- [http://devblog.avdi.org/2011/07/05/demeter-its-not-just-a-good-idea-its-the-law/](http://devblog.avdi.org/2011/07/05/demeter-its-not-just-a-good-idea-its-the-law/)
- [http://vimeo.com/53276460](http://vimeo.com/53276460)
- [http://nicksda.apotomo.de/2011/10/rails-misapprehensions-helpers-are-shit/](http://nicksda.apotomo.de/2011/10/rails-misapprehensions-helpers-are-shit/)
- [http://www.youtube.com/watch?v=qPfQM4w4I04](http://www.youtube.com/watch?v=qPfQM4w4I04)


[1]: http://www.octo.com/
[2]: https://twitter.com/jeremyvenezia
[3]: https://www.humancoders.com/
[4]: http://rubyonrails.org/
[5]: https://twitter.com/21croissants)
[6]: https://twitter.com/matthieusegret
[7]: /img/2013-11-18/formation.jpg
[8]: http://cakephp.org/
[9]: http://rspec.info/
[10]: https://github.com/travisjeffery/timecop
[11]: https://github.com/bebanjo/delorean
[12]: https://github.com/sporkrb/spork
[13]: https://github.com/rails/spring
[14]: https://github.com/burke/zeus
[15]: https://github.com/guard/guard
[16]: https://github.com/colszowka/simplecov
[17]: https://travis-ci.org/
[18]: https://github.com/SchemaPlus/schema_validations
[19]: https://github.com/pcreux/rspec-set
[20]: https://github.com/zipmark/rspec_api_documentation
[21]: http://www.seleniumhq.org/
[22]: https://saucelabs.com/
[23]: https://github.com/jnicklas/capybara
