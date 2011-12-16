                                   _     _                   
                   _ __  _   _ ___| |__ | |_ __ _ _ __   ___ 
                  | '_ \| | | / __| '_ \| __/ _` | '_ \ / _ \
                  | |_) | |_| \__ \ | | | || (_| | |_) |  __/
                  | .__/ \__,_|___/_| |_|\__\__,_| .__/ \___|
                  |_|                            |_|

This module uses the Features module (http://drupal.org/project/features) to
create an album and track content type with standard fields. It is a useful
starting point for adding music publishing functionality to your site, and
the intention is to provide a common feature set that people can then customize
further and share their recipes with others.

You can modify the fields or add to them, just keep in mind that it may be
difficult to upgrade to future versions of this module. 

This module also intends to solve common workflow problems related to grouping
tracks into albums.

More info: www.pushtape.com.

/**
  * INSTALLATION
  */
1) Navigate to the admin/modules page and turn on both the Pushtape and Pushtape Music modules.
2) Go to node/add/track to start by adding a track.
3) Go to /releases to see a list of recently added albums and single tracks.
4) Configure sitewide settings (see recommended settings below)

/**
  * RECOMMENDED SETTINGS (Will be automated in the Pushtape distribution)
  */
  
GENERAL SETTINGS
Set your homepage to /releases
Enable "View: releases" block on the right or left sidebar for all pages except /releases.
Turn on the Toolbar module and use that for site management.
Turn off Overlay and any other unnecessary modules.
Use Seven for the administration theme.
Create a new user with the "artist" role, configure simple permissions and use that for general site management (not user/1).

PATHAUTO SETTINGS (admin/config/search/path/patterns)
Pattern for all Album paths: release/[node:title]
Pattern for all Basic page paths: page/[node:title]
Pattern for all Track paths: track/[node:title]

/**
  * ADDITIONAL INFO
  */
  
CONTENT TYPES (admin/structure/types)
Album: admin/structure/types/manage/album
Track: admin/structure/types/manage/track

VIEWS
releases (a list of albums and singles (tracks not on an album). [block, page /releases]
albums (a list of albums). [block, page /albums]
tracks (a list of tracks. block, page /tracks

IMAGE STYLES
artwork_thumbnail
artwork_small
artwork_medium
artwork_large
artwork_huge (1600x1200)

MAINTAINERS
zirafa (http://drupal.org/user/10692)