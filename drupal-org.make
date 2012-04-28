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

; Here you see the format of an array in a .make file. Text enclosed
; in brackets are array keys, and each set to the right of the last is
; a layer deeper in the array. Note that the root array element is
; not enclosed in brackets:
; root_element[first_key][next_key] = value

; The projects attribute is where you define the modules/themes that
; are to be packaged with the profile. The first key is the short name
; of the project (as seen in the drupal.org/project/{projectshortname}
; URI). Note that you *must* specify an exact version of a module or
; theme (one that points to an 'official' release node) -- you cannot
; use development releases!

; These projects are defined using the short form definition. You can
; use this form if you only want to declare the version of the project.
; The version is the value to the right of the core Drupal version in a full
; version string. For example, if you wanted to specify Views 6.x-2.7,
; you would use:

projects[entityreference] = 1.0-rc1
projects[features] = 1.0-rc1
projects[file_entity] = 2.0-unstable3
projects[pathauto] = 1.0
projects[references] = 2.x-dev
projects[ctools] = 1.0
projects[token] = 1.0
projects[views] = 3.3
projects[media] = 2.0-unstable3
;projects[pushtape_features] = 1.4 --> using dev version from github below

; Devel Tools
projects[diff][version] = "2.0"
projects[libraries][version] = "2.x-dev"
projects[strongarm][version] = "2.0-rc1"
projects[devel][version] = "1.2"
projects[coder][version] = "1.x-dev"



projects[omega_tools][version] = "3.0-rc4"
projects[delta][version] = "3.0-beta9"


; Playlist addon dependencies (should be included in the feature)
;projects[beautytips][version] = "2.0-beta1"
;projects[better_exposed_filters][version] = "3.0-beta1"
;projects[colorbox][version] = "1.2"
;projects[download_file][version] = "1.1"
projects[entity][version] = "1.0-rc1"
;projects[field_group][version] = "1.1"
;projects[hierarchical_select][version] = "3.x-dev"
projects[soundmanager2][version] = "2.x-dev"
;projects[uniform][version] = "1.10"
projects[views_bulk_operations][version] = "3.0-rc1"

; Libraries
libraries[grammar_parser_lib][version] = "1.x-dev"

; Soundmanager2
libraries[soundmanager2][download][type] = "get"
libraries[soundmanager2][download][url] = "http://www.schillmania.com/projects/soundmanager2/download/soundmanagerv297a-20120318.zip"
libraries[soundmanager2][directory_name] = "soundmanager2"
libraries[soundmanager2][type] = "library"

;Pushtape apps

;projects[pushtape_features][type] = "module"
;projects[pushtape_features][download][type] = "git"
;projects[pushtape_features][download][url] = "git://github.com/discipolo/pushtape_features.git"
;projects[pushtape_features][download][branch] = "7.x-2.x"
;projects[pushtape_features][subdir] = pushtape_apps

projects[pushtape_features][location] = http://apps.rosenstrauch.com/fserver
projects[pushtape_features][subdir] = pushtape_apps
projects[pushtape_mediaplayer][location] = http://apps.rosenstrauch.com/fserver
projects[pushtape_mediaplayer][subdir] = pushtape_apps



projects[omega] = 3.1

projects[omega_pushtape_theme][location] = http://apps.rosenstrauch.com/fserver

;projects[omega_pushtape][type] = "theme"
;projects[omega_pushtape][download][type] = "git"
;projects[omega_pushtape][download][url] = "http://git.drupal.org/sandbox/discipolo/1474174.git"
;projects[omega_pushtape][download][branch] = "7.x-1.x"