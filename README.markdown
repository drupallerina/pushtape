# This Project #



## This Repository #
This is an INSTALLPROFILE
- is my development clone tracking the changes from http://git.drupal.org/project/pushtape.git


0. master branch
  - empty according to http://drupal.org/empty-git-master
1. upstream/7.x-1.x http://drupalcode.org/project/pushtape.git
this branch we all always have in common. one person is responsible for pulling in changes from our dev branches. (or appliyng patches supplied) 
  - is tracking the changes from http://git.drupal.org/project/pushtape.git

2. 7.x-1.x-discipolo my dev branch. changes i propose to be comitted to the "master" branch (7.x-1.x on drupal.org)

- is a "fork" of http://drupal.org/project/pushtape ,
- is implementing my proposed changes and solutions from this issuequeue http://drupal.org/project/issues/pushtape_features
  - [deprecate nodereference in favour of entity reference](http://drupal.org/node/1460296)
  - [extension to add upload and player to tracks](http://drupal.org/node/1476866)
  - [renames pushtape_music and makes it into a standalone feature](http://drupal.org/node/1647728)
- and adds a subtheme
- to get it just run <code>drush make https://raw.github.com/discipolo/pushtape/08c45e532948b9e40d13ccb37d8014fb3822a903/pushtape-devel.build</code>

3. 7.x-1.x-panopoly feature branchfor demonstration purposes. proof of concept for apps and panels. these changes are not proposed to be comitted

 is an _apps_ enabled branch that investigates http://drupal.org/project/panopoly as a base distribution. 
  - [panels or context for layouts](http://drupal.org/node/1357908)
- also is implementing my proposed changes and solutions from this issuequeue http://drupal.org/project/issues/pushtape_features
  - [deprecate nodereference in favour of entity reference](http://drupal.org/node/1460296)
  - [extension to add upload and player to tracks](http://drupal.org/node/1476866)
  - [renames pushtape_music and makes it into a standalone feature](http://drupal.org/node/1647728)

- additionally attempts to approach some of the issues from  http://drupal.org/project/issues/pushtape