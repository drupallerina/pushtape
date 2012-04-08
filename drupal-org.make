; This is a comment. Anything starting with a semicolon is a comment
; and will be ignored by the parser. Blanks lines are also ignored.
;
; The file uses standard info file format:
; attribute = value

; REQUIRED ATTRIBUTES

; The version of Drupal the profile is built for. You must include both a
; major and a minor release - just specifying 6.x won't work
core = 7.12
api = 2

; OPTIONAL ATTRIBUTES

projects[features] = 1.0-rc1
projects[file_entity] = 2.0-unstable3
projects[pathauto] = 1.0
projects[references] = 2.x-dev
projects[ctools] = 1.0
projects[token] = 1.0-rc1
projects[views] = 3.3
projects[media] = 2.x-dev
;projects[pushtape_features] = 1.4


; panopoly

projects[fieldable_panels_panes] = 1.0
projects[link] = 1.0
projects[media_vimeo] = 1.0-beta5
projects[media_soundcloud] = 1.0-alpha1
projects[panels] = 3.2
projects[simple_gmap] = 1.0-rc1
projects[tablefield] = 2.0-beta6

projects[apps][subdir] = contrib
projects[apps][type] = module
;projects[apps][version] = 1.x-dev
projects[apps][patch][1479164] = http://drupal.org/files/1479164-apps-permissions-check-modules-not-conf-reroll.patch
projects[apps][patch][1479536] = http://drupal.org/files/apps-multiple-install-servers-1479536-4.patch
projects[apps][patch][1480912] = http://drupal.org/files/apps-clean-up-the-cleanup.patch
projects[apps][patch][1482684] = http://drupal.org/files/apps-single-item-style.patch
projects[apps][patch][1484300] = http://drupal.org/files/apps-check-empty-multiple-servers.patch
projects[apps][download][type] = git
projects[apps][download][revision] = b1cf924
;projects[apps][download][branch] = 7.x-1.x



; Playlist addon dependencies
projects[beautytips][version] = "2.0-beta1"
projects[better_exposed_filters][version] = "3.0-beta1"
projects[colorbox][version] = "1.2"
projects[download_file][version] = "1.1"
projects[entity][version] = "1.0-rc1"
projects[field_group][version] = "1.1"
projects[hierarchical_select][version] = "3.0-alpha5"
projects[soundmanager2][version] = "2.x-dev"
projects[uniform][version] = "1.10"
projects[views_bulk_operations][version] = "3.0-rc1"

; Libraries
; Please fill the following out. Type may be one of get, git, bzr or svn,
; and url is the url of the download.
libraries[soundmanager2][download][type] = "get"
libraries[soundmanager2][download][url] = "http://www.schillmania.com/projects/soundmanager2/download/soundmanagerv297a-20120318.zip"
libraries[soundmanager2][directory_name] = "soundmanager2"
libraries[soundmanager2][type] = "library"

; Please fill the following out. Type may be one of get, git, bzr or svn,
; and url is the url of the download.
libraries[uniform][download][type] = "git"
libraries[uniform][download][url] = "https://github.com/pixelmatrix/uniform.git"
libraries[uniform][directory_name] = "uniform"
libraries[uniform][type] = "library"

; Please fill the following out. Type may be one of get, git, bzr or svn,
; and url is the url of the download.
libraries[colorbox][download][type] = "get"
libraries[colorbox][download][url] = "http://www.jacklmoore.com/colorbox/colorbox.zip"
libraries[colorbox][directory_name] = "colorbox"
libraries[colorbox][type] = "library"

; Devel Tools


projects[diff][version] = "2.0"
projects[libraries][version] = "2.0-alpha2"
projects[strongarm][version] = "2.0-beta4"
projects[devel][version] = "1.2"
projects[coder][version] = "1.0"
projects[omega_tools][version] = "3.0-rc4"

projects[pushtape_features][type] = "module"
projects[pushtape_features][download][type] = "git"
projects[pushtape_features][download][url] = "git://github.com/discipolo/pushtape_features.git"
projects[pushtape_features][download][branch] = "7.x-1.x-apps"

; Defining a theme is no different.

projects[omega] = 3.1

projects[omega_pushtape][type] = "theme"
projects[omega_pushtape][download][type] = "git"
projects[omega_pushtape][download][url] = "http://git.drupal.org/sandbox/discipolo/1474174.git"
projects[omega_pushtape][download][branch] = "7.x-1.x"