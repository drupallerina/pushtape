Drupal Pushtape Server
==

This makes it possible to build pushtape (musician) sites

Requirements
------------

* [drush](http://drupal.org/project/drush) 
* [drush_make](http://drupal.org/project/drush_make)

Installation
------------

To build a complete site, run:

    drush make pushtape-devel.build ~/workspace/pushtape
    
Then setup the following:

    cp sites/default/default.settings.php sites/default/settings.php
    chmod 777 sites/default/settings.php
    mkdir sites/default/files
    chmod 777 sites/default/files

Navigate to the root directory in a webbrowser.

#### Update existing install profile ####

If you want to update just the install profile instead of rebuilding the
entire site, you can run this:

    drush make --no-core --contrib-destination=. pushtape.make

#### Rebuild everything ####

If you want to force a rebuild of everything, you can run this:

    drush si pushtape


#this project #

- is tracking the changes from http://git.drupal.org/project/pushtape.git
- attempting to extened it in different ways

##the 2.x branch #

- is a "fork" of http://drupal.org/project/pushtape ,
- its updating some modules (references and media if you must know) )
- and adds a subtheme
- to get it just run <code>drush make https://raw.github.com/discipolo/pushtape/08c45e532948b9e40d13ccb37d8014fb3822a903/pushtape-devel.build</code>

##the master branch #

- is an inital attempt at creating an install profile _extending_ http://drupal.org/project/pushtape (the approach was inspired by nodestream 2.x) 
- including modules neccessary for importing from drupalgardens
- it might or might not take the app approach.

##the 3.x branch #

- is an _apps_ enabled branch that investigates http://drupal.org/project/panopoly
- attempts to include panopoly in the same way openacademy does, in effect adding pushtape_features_app to it
- is currently behind panopoly, but will be kept up to date if we figure out how