Introduction

https://drive.google.com/a/octo.com/file/d/0B9TWpnns-0YDOWIzQUNrVndlMnR0c0FJbmxKaUlycWR4UXR3/edit

JVE avait gagné une formation HumanCoders mais comme il ne pouvait pas y aller, il l’a proposé sur tech, et j’ai été le premier à sauter dessus. Débutant en Rails et n’ayant jamais fait de tests, c’était exactement ce qu’il me fallait et ce que je voulais apprendre.

La formation a donc eu lieu sur deux jours, dans un appartement parisien à République loué sur AirB&B. Nous étions trois élèves, un formateur (Jean-Michel Garnier) et Matthieu Segret de HumanCoders.



Jean-Michel fait normalement cette formation en une journée, mais comme nous en avions deux, cela nous a permis de poser plein de questions et de pouvoir rentrer plus profondément dans certains aspects. La formation est destinée à des gens qui connaissent déjà Rails, mais qui n’ont jamais fait de tests, ou peu. Pour ma part, je n’avais pas non plus fait de Rails, mais venant d’un background cakePHP, je n’ai pas vraiment été perdu.

Différents types de tests

Précision sur les 3 principaux types de tests :
- Tests Unitaires : Où on teste une classe, en l’isolant de ses dépendances.
- Tests d’Intégration : Où on teste une classe et ses dépendances.
- Test d’Acceptance : Où on teste un scénario utilisateur complet (full stack).
A noter que Rails semble se tromper dans la manière dont il nomme ses différents types de tests par rapport à cette définition.

Qu’est-ce qu’un bon test ?
- Lisible (peut alors faire office de documentation)
- Petit (idéalement une assertion / test)
- Indépendant (peuvent être executés de manière random sans incidence)
- DRY (pas de copier-coller)
- Rapide (<0.10s/test, permet un feedback rapide)

TDD : Red, Green, Refactor. Pas forcément nécessaire de commencer par là quand on n’a jamais fait de tests, mais une bonne manière de travailler qui force à avoir un code structuré et testable. Avancer par baby steps.

RSpec

RSpec est le framework de tests unitaires de Rails. Plein de magie Ruby dans sa syntaxe. API a déjà changé régulièrement par le passé et la v3 qui arrive la change encore.





Exemple de hiérarchie de test RSpec
describe "Class" do
	it "has a feature"
		pending "todo"
	end
end

Il existe une convention a peu près générale sur la manière de nommer les variables que l’on teste : actual et expected
actual.should == expected
expect(actual).to eq expected

Attention, différence entre .eq, .eql et .equal.
a.should eq(b) / a.should == b : Teste si la valeur est la même, même de types différents
a.should eql(b) : Teste si le type et la valeur sont identiques
a.should equal(b) : Teste si les deux variables références le même objet

Syntaxe magique à base de should, should_not. Faite de manière à ce que les tests soient facilement lisible, comme de la prose. En pratique, parfois un peu compliqué à écrire, à savoir où placer le _ dans .should_not raise_error et non pas .should_not_raise error, etc.

Tips RSpec

subject permet de définir le sujet de tous les tests d’un describe.
subject { 18 }
it  {  should  >  15  }
it  {  should  be  >  15  }
it  {  should_not  be  =  19  } 

Plutot utiliser match_array que include car donne plus d’informations en cas de fail (clés communes, clés différentes).

let qui permet de memoize un block pour retourner toujours la même valeur. On l’a très rapidement survolé dans la formation, sans l’utiliser en pratique ensuite.

Utiliser les callback before(:each), before(:all), after(:each), after(:all) pour simplifier ses tests, les render indépendants.

Ajouter l’option --order rand à son fichier .rspec pour forcer les tests de manières random, s’assurant donc qu’ils sont indépendants.
De même, ajouter --backtrace pour avoir le contexte complet de là où les tests fails, utile pour le debug.

Ajouter ActiveRecord::Base.logger  =  Logger.new  $stdout à son fichier de test
pour avoir le dump des requetes sql dans le test pour débugguer. Ajoute plein
de requetes des frameworks de tests, donc à utiliser avec parcimonie.

L’utilisation de gems comme timecop ou delorean permet de jouer finement avec la notion du temps dans les tests.

WTF RSpec

Petit moment WTF de la formation où la syntaxe “magique” de RSpec s’est retournée contre nous !

Le code suivant marche parfaitement :
expect { Object.new.foo }.to raise_error { |error|
	error.should be_a(NameError)
}

En modifiant la syntaxe {||} en do |error| end, alors le block de test passe toujours, se transformant donc en un faux positif à chaque fois.
expect {Object.new.foo}.to raise_error do |error|
	error.shoul be_a(NameError)
end

Le problème vient de l’absence de parenthèses autour de raise_error qui gène RSpec dans la compréhension de son contexte. Voici le nouveau code qui marche correctement.

expect {Object.new.foo}.to(raise_error) do |error|
	error.shoul be_a(NameError)
end

A faire attention car donne la fausse sensation que notre test passe alors qu’il ne fait en fait rien du tout.

Outils annexes

Les test RSpec sont lents, car ils doivent instancier la totalité de l’app à chaque fois. Cela casse le principe même du feedback rapide si on doit attendre ~20s à chaque tests. Pour ça il existe des outils comme Sprok, Spring et Zeus. Pour avoir utilisé longuement les trois, notre formateur nous a conseillé Zeus.
Il suffit de lancer zeus start dans un terminal, puis zeus rspec /path/to/file.rb pour lancer le test, qui sur ma machine passe de 7s à 0.2s. Impressionant.

Attention toutefois, zeus n’est pas bulletproof et nécessite un restart lors de certains changements de code (gemfile, i18n, etc). Et nécessite un workaround pour faire fonctionner le mode random de RSpec.

Autres outils rapidement survolés : Guard, SimpleCov et Travis.

Cas pratiques

La question a été soulevée de la redondance de code entre les règles de validation du modèle et les tests de validation qui vont avec. Est-ce utile de l’avoir deux fois ? Si non, lequel garder ? Une piste suggérée par le formateur est d’utiliser la gem schema_validation qui génère les régles de validation en fonction du schema de la base.

Utilisation de FactoryGirl pour définir des DSL de son domaine métier pour facilement abstraire et tester.

Par défaut RSpec efface la db de test après les tests, ce qui est embetant pour réussir à traquer un bug. Pour contrer ça, on peut modifier la valeur de config.use_transactional_fixtures et ajouter des before/after et la gem DatabaseCleaner pour vider la base avant les tests et entre chaque tests, mais la laisser après, pour pouvoir l’étudier au besoin. Elle permet aussi de choisir quelles tables vider (pour par exemple laisser les tables de références de pays/i18n/etc)

Possibilité d’utiliser la gem rspec-set qui permet de définir un ou plusieurs objets en base qui reviendront toujours à leurs valeurs par défaut entre chaque test, même en cas d’update/delete.

On a aussi été mis en garde contre le fait de faire des tests avec un db de test aux volumes très différents de la db de prod. Des problèmes peuvent survenir en prod quand les données sont bien plus importantes et la db devient un bottleneck : dans ce cas, utiliser un dump anonymisé de la db de prod pour faire les tests sur des données réelles.

Tester la récupération des x derniers éléments ajoutés en base pose problème dans le cadre d’un test car les éléments qu’on ajoute seront ajoutés avec la même date. Il est donc parfois nécessaire de leur spécifier une date manuellement plutot que de laisser Rails le faire.

Tester une API

RSpec permet de tester une API, mais ne passe pas réellement par la couche réseau, à la place, il se pluggue sur les routes définies dans Rails. Inconvénient : ne teste pas réellement tout le traffic.

Avec une API bien définie, on peut même créer sa documentation directement avec une gem comme https://github.com/zipmark/rspec_api_documentation qui indique alors les points d’entrées, les arguments attendus et des exemples de réponse.

Tests Full Stack

Ils testent la totalité de l’app depuis le point de vue de l’utilisateur final, dans un browser. Ces tests sont lents et error prone. Il existe plusieurs drivers (webkit, chrome, selenium), avec ou sans javascript. Il est aussi possible d’utiliser saucelabs, qui est un SaaS qui permet d’automatiser ses tests sur plusieurs browsers et OS. Ou alors http://terminus.jcoglan.com/ pour Android, iOS.

On utilise pour cela capybara, qui possède des méthodes simples d’interaction comme visit, fill_in, click_on, etc. On peut alors tester des scénarios de remplissage de formulaire et tester qu’une phrase est bien affichée en réponse (on ne teste pas que les éléments soient bien entrés en DB, même si on peut le faire, c’est normalement un autre test, qui ne passe pas par le browser qui s’occupe de ça).

On peut débugguer ces tests avec la méthode save_and_open_page qui ouvre la page en cours dans notre browser.

Globalement, venant d’un background front-end, j’ai trouvé ces tests beaucoup trop couplés au DOM de la page et donc assez fragile. Soit on teste sur du css, et alors ça casse quand on modifie notre page, soit on teste sur des phrases affichées, et alors ça casse quand le wording change ou que le site change de langue. Brer, ça reste fragile, et pas sur que le temps investi a écrire ces tests soit rentabilisé.

Néanmoins, comme intégré à Rails, il y a possibilité de se plugguer directement sur Rails avec par exemple la méthode login_as qui permet de ne pas être obligé de passer manuellement par le form de login à chaque test.

Doubles, Stubs, Mocks, etc

On arrive au dernier gros morceau de la formation. Un double est un objet stupide qui ne fait rien, à part répondre aux méthodes qu’on lui appelle. On peut en créer avec RSpec avec double("name", method1: response1, method2: response2).
On peut aussi stub un objet existant, en modifiant une de ses méthodes pour la court-circuiter et définir ce qu’elle doit retourner. Cela permet d’éviter des appels couteux à un API ou une DB et 
forcer un certain retour.
Attention toutefois, il est tentant de stubber un modele et toutes ses dépendances, mais cela devient impossible à maintenir. Trop de stub = code smell. Mieux vaut séparer son code en plusieurs entités plus facilement testables.

Les mocks sont des stubs améliorés. On court-circuite toujours l’appel à la méthode, qui ne fait donc plus rien, et on peut toujours définir ce que l’on attends comme réponse. Mais en plus on peut faire des tests sur le nombre de fois que la méthode à été appellé et/ou avec quels arguments.

Enfin, on a abordé rapidement les fake objects et les spy objects. Mais bien trop rapidement pour que je ne me souvienne de leur utilité…

Pour terminer

Finalement, on est passé rapidement sur les méthodes de RSpec pour tester les mailers, les routes, les controlleurs et les helpers.

Les slides de la formation
En pdf: https://drive.google.com/a/octo.com/file/d/0B9TWpnns-0YDOWIzQUNrVndlMnR0c0FJbmxKaUlycWR4UXR3/edit?usp=sharing
En html: https://drive.google.com/a/octo.com/file/d/0B9TWpnns-0YDZWg1OVdHYkFZMmtlaldXa25HcnBnblZZY1lj/edit?usp=sharing

S’il n’y avait qu’un seul bouquin à lire, ce serait : Practical Object-Oriented
Design in Ruby de Sandi Metz
http://www.poodr.info/

Et sinon, plein de liens :
http://blog.mattwynne.net/2013/11/18/costs-and-benefits-of-test-automation/
http://stackoverflow.com/questions/11006888/testing-how-to-focus-on-behavior-instead-of-implementation-without-losing-speed/11023669#11023669
http://www.poodr.com/
http://blog.jonasbandi.net/2011/08/test-driven-it-is-mindset-not-tool.html
http://robots.thoughtbot.com/lets-not
http://parlonsruby.com/pr002-guard-avec-thibaud-guillaume-gentil-et-remy-coutable/
http://www.fastrailstests.com/
http://bjeanes.com/2012/02/factories-breed-complexity
https://github.com/zipmark/rspec_api_documentation
http://devblog.avdi.org/2011/07/05/demeter-its-not-just-a-good-idea-its-the-law/
http://vimeo.com/53276460
http://nicksda.apotomo.de/2011/10/rails-misapprehensions-helpers-are-shit/
http://www.youtube.com/watch?v=qPfQM4w4I04













