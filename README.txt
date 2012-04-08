#this project #

- is tracking the changes from http://git.drupal.org/project/pushtape.git
- attempting to extened it in different ways

##the 2.x branch #

- is a "fork" of http://drupal.org/project/pushtape ,
- its updating some modules (references and media if you must know) and adds an optional (experimental) playlist feature)
- and adds a subtheme
- to get it just run <code>drush make https://raw.github.com/discipolo/pushtape/08c45e532948b9e40d13ccb37d8014fb3822a903/pushtape-devel.build</code>

##the master branch #

- is an inital attempt at creating an install profile _extending_ http://drupal.org/project/pushtape (the approach was inspired by nodestream 2.x) 
- including modules neccessary for importing from drupalgardens
- it might or might not take the app approach.

##the 2.x-panopoly #

- is an _apps_ enabled branch that investigates http://drupal.org/project/panopoly
- attempts to include panopoly in the same way openacademy does, in effect adding pushtape_features_app to it