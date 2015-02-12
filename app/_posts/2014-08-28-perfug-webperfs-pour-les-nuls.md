---
layout: post
title: "perfUG : Les Webperfs pour les nuls"
tags: perfUG
---

### Disclaimer
*Pour une fois, le compte-rendu n'est pas de moi car cette fois-ci j'étais de
l'autre coté, en tant que speaker. Remerçions dont [Benjamin
Brabant](https://twitter.com/Maastiff) pour ce
superbe compte-rendu.*

*Vous pouvez retrouver plus d'infos sur l'évenement sur le site du
[perfUG](http://perfug.github.io/compte-rendu/2014/08/31/compte-rendu-du-perfug--webperfs-pour-les-nuls/),
dont [la vidéo de la présentation](http://octo.ubicast.tv/permalink/v12516c17909efi73ga5/).*

Timothée pour son premier talk en meetup nous a fait une super présentation,
pratique, claire et abordable, des bonnes méthodes à suivre pour optimiser
basiquement les performances de son application Web.

Pourquoi parler de performances ? D'après des études, la lenteur d'une
application était ressentie au bout de 4 secondes en 2008, elle l'est au bout
de 3 secondes en 2014 ce qui dénote bien les enjeux en termes de performances
sur le web. La nouvelle génération née dans la ferveur technologique du 21ème
siècle n'a pas connu les modems 56k contrairement à ses ainés. Elle est
habituée à l'instantané et est donc bien moins patiente !

# Serveur

Tout d'abord on évoque les optimisations que l'ont peut faire de manière
générale du côté serveur. En trois mots :

  * Concatenate
  * Compress
  * Cache

## Contatenate

    
**Objectif : Télécharger le moins possible**
    

Télécharger plus de fichiers engendre des coûts incompressibles qui entrainent
un goulot d'étranglement dû à :

  * Latence DNS
  * TCP Slow-start
  * Overhead SSL
  * Nombre maximum de connections parallèles

Une simple inspection des flux réseau depuis son navigateur permet de voir
rapidement ceux qui appliquent ces guidelines (ex:
[france.fr](http://www.france.fr) 18 CSS / [github.com](http://www.github.com)
2 CSS) !

## Compression

    
**Objectif : Télécharger des fichiers plus léger**
    

### GZip

GZip est un outil disponible sur tous les serveurs et compris par tous les
navigateurs du marché (IE5.5+). Le gain de compression est de 66% en moyenne.
Très simple à configurer sur les serveur (Apache, Lighttpd, nginx) qui ont des
modules adéquats.

Techniquement, cela consiste dans le header à ajouter un encoding particulier
qui va permettre aux navigateurs de savoir quoi faire

### Minification

Une autre méthode consiste à minifier les fichiers. Cette méthode est
spécifique au langage et consiste globalement à de la suppression,
mutualisation, obfuscation du code. Quelques outils pour cela :

  * CSS : cleancss
  * JS : uglifyjs
  * HTML : html-minifier

## Cache

    
**Objectif : Télécharger moins souvent**
    

Consiste à définir une date limite de consommation. Ainsi le navigateur ne
renverra pas la requête au serveur si la fraîcheur est bonne et récupérera le
résultat dans son cache. Deux headers :

  * `Expires: Thu, 04 May 2014 20:00:00 GMT` : ne pas utiliser car tous les clients vont invalider leur cache en même temps
  * `Cache-Control: max-age=3600, must-revalidate` : utiliser en priorité puisqu'on définit cette fois une durée

### Validation

La validation consiste à vérifier que le client possède la dernière version :

  * Oui : 304 - Not Modified
  * Non : 200 - OK

Deux headers :

  * `Last-Modifier: Mon, 04 May 2014 02:28:12` / `Ìf-Modified-Since` : A utiliser en priorité, fonctionne bien
  * `ETag: "3e86-410-3596fbbc"` / `If-None-Match` : Les serveurs se basent généralement sur le _inode_ qui, si les ressources sont placées derrière un load balancer par exemple, va retourner un tag différent pour chaque serveur pour un fichier pourtant identique sur tous. Ce problème peut se résoudre en ajoutant quelques configuration supplémentaires pour le serveur

### Invalidation

Pour invalider le cache, une méthode sûre consiste à renommer les fichiers
assets à chaque modification en utilisant un tag dans le filename.

D'autres parts, le header de requête `Pragma : no-cache` permet de demander
une version non cachée de la ressource. NB : Ce header dans la response du
serveur ne sert à rien.

# Images

Les images pèsent lourd sur une page web (plus de 50% du poids global) et font
800Ko en moyenne. Pour les sites web faisant un usage de photos intensif,
suivre les quelques préconisations suivantes peuvent apporter un véritable
gain en performance. Le premier conseil donné est d'utiliser essentiellement
seulement les formats : 

  * JPG pour photographie
  * PNG pour logo et éléments du template
  * SVG si besoin particuliers

## Compress

### Lossless

La première compression qui n'entraine pas de perte de qualité consiste à
supprimer les métadonnées des images telles que :

  * Orientation, exposition, flash, focale
  * Date, GPS
  * Modèle appareil
  * Aperçu, historique
  * Tags, commentaires

L'outil `exiftool` permet de consulter et parfois manipuler les métadonnées
pour un grand nombre de formats. L'outil `jpegtran` permet de manipuler les
images JPG et notamment leurs métadonnées.

```sh
jpegtran -optimize -copy none
```
    

### Lossy

Cette fois, la compression entraine une suppression d'informations de l'image
en elle-même et donc une dégradation de la qualité. Généralement une
compression à 80% est raisonnable.

```sh 
jpegoptim -m80 --strip-all
```    

NB : L'option `strip-all` supprime également toutes les métadonnées.

## Sprites

Les sprites (dont le nom provient de la technique utilisée pour l'animation
des premiers jeux vidéo) consiste à regrouper plusieurs images (logos et
icones généralement) sur la même image. On joue alors sur le background
position pour afficher la bonne image.

```css
a {
  display:block;
  width:15px;
  height:15px;
  background:url(image.png) 0px 0px no-repeat;
}
a:hover {
  background-position:0px -15px;
}
```

Quelques outils pour réaliser ses sprites :

  * Compass
  * www.spritecow.com
  * grunt spritely

# Javascript

La balise `<script>` lorsqu'elle est interprétée par le navigateur bloque
complètement le parsing du reste du document. En effet, la fonction
`document.write`, tombée en désuétude maintenant, permettait de modifier la
page courante et obligeait donc le navigateur à charger les scripts tout de
suite.

Solutions :

  * Mettre les balises `<script>` en bas de page
  * Attribut `defer` de la balise `<script>` qui permet de les définir en entête et de laisser le navigateur les placer à la fin pour nous. Malheureusement, IE ne suit pas la spécification et n'offre aucune garantie sur l'ordre d'exécution des scripts.
  * Attribut `async` permet de charger les scripts en arrière-plan n'offrant aucune garantie sur l'ordre d'exécution.
  * Une bonne méthode consiste également à essayer de séparer les scripts par priorité (un premier contenant les scripts liés aux éléments clés de la page, le second concernant par exemple la pub, le tracking, le sharing)

Il faut être bien conscient que JavaScript est un langage interprété. Le code
écrit est donc celui qui va être téléchargé et exécuté. On a donc tout intérêt
à le maintenir le plus petit possible pour des raisons de performance au
chargement et à l'exécution. Par exemple, attention aux instructions que l'on
va masquer par un attribut booléen `DEBUG` et qui vont être malgré tout
interprétées par le navigateur. Dans la mesure du possible, supprimer tout
code inutile en production.

Le site [microjs.com](http://www.microjs.com) se révèle être un bon outil pour
trouver de très petites librairies (pour chacune le poids est clairement
indiqué) répondant à nos besoins tout en ne surchargeant pas la page.

# CSS

Les feuilles de style de dérogent pas à la règle d'optimisation. Il est
nécessaire de comprendre certains mécanismes sous-jacents à l'application des
styles pour être conscient de l'impact que cela peut avoir sur les
performances.

La modification d'une propriété va déclencher l'une des deux opérations
suivantes :

  * repaint : consiste à changer la couleur des pixels de l'écran.
  * reflow : entraine le recalcul complet de la page. Lorsqu'on redimensionne un bloc par exemple, ce mécanisme est inévitable.

Pour maximiser les performances, il faut limiter au maximum les reflow. Le
site [csstriggers.com](http://www.csstriggers.com) permet de savoir pour
chaque propriété si sa modification entraine un repaint ou un reflow.

Pour limiter les reflows, on peut suivre ces quelques guidelines :

  * CSS en haut de page
  * Insérer dans le DOM en "batch"
  * Taille des images indiquées dans le HTML permet d'éviter un reflow à chaque nouvelle image à afficher
  * Préférer le border transparent qui change de couleur plutôt que d'ajouter un border qui nécessite un reflow

## Parseur

Le parseur CSS est contre intuitif. Lorsqu'il rencontre une balise, il va
chercher dans les règles CSS les éléments qui matchent en regardant de droite
à gauche chaque définition CSS. Le mieux est donc d'avoir les éléments de
droite le plus spécifique possible.

Bonnes pratiques :

  * utiliser des classes plutôt que des Tags
  * pas plus de trois niveaux
  * pas de sélecteur universel `.menu *` (sauf tout seul)
  * pas d'expression régulière d'attribut `a[href^="http://"]`
  * ne pas négliger la lisibilité de son code CSS (sachant que les optimisations du CSS n'ont un réel impact qu'à partir de plusieurs milliers de propriétés)

## Perception

La perception humaine de la vitesse d'une page et à prendre en compte
absolument. Il consiste en règle général à utiliser quelques subterfuges
donnant une sensation de rapidité à l'utilisateur et repose sur un affichage
progressif des éléments de la page. Pour cela :

  * `startRender` rapide
  * Configurer les JPG en mode _progressif_ avec `jpegoptim`
  * Utiliser des placeholders
  * LazyLoading pour n'afficher que ce qui se voit à l'écran

Les géants du web n'hésitent pas à "tricher" en utilisant des techniques
faisant illusion que le chargement est rapide !

  * Feedback en avance (Instagram)
  * Illusion d'optique (Dans GMail, les pixels de début et fin de la barre de progression n'ont aucun lien avec l'avancement du chargement mais sont là pour faire illusion que ça avance)
  * Firefox entre ses releases a accéléré la vitesse de son spinner de chargement pour donner une impression de meilleures performances au fil des nouvelles versions
  * Facebook après un sondage s'est rendu compte que les utilisateurs qui avait le spinner iOS pour le chargement reportaient la faute de lenteur sur Apple contrairement à ceux qui avaient le spinner de chargement Facebook


