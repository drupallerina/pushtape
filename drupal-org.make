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

;Pushtape apps

;projects[pushtape_features][location] = http://apps.rosenstrauch.com/fserver
projects[pushtape_features][type] = "module"
projects[pushtape_features][download][type] = "git"
projects[pushtape_features][download][url] = "git://github.com/discipolo/pushtape_features.git"
projects[pushtape_features][download][branch] = "7.x-2.x"
projects[pushtape_features][subdir] = pushtape_apps

;projects[pushtape_mediaplayer][location] = http://apps.rosenstrauch.com/fserver
projects[pushtape_mediaplayer][type] = "module"
projects[pushtape_mediaplayer][download][type] = "git"
projects[pushtape_mediaplayer][download][url] = "git://github.com/discipolo/pushtape_mediaplayer.git"
projects[pushtape_mediaplayer][download][branch] = "7.x-2.x"
projects[pushtape_mediaplayer][subdir] = pushtape_apps

;projects[pushtape_connect][location] = http://apps.rosenstrauch.com/fserver
projects[pushtape_connect][type] = "module"
projects[pushtape_connect][download][type] = "git"
projects[pushtape_connect][download][url] = "git://github.com/discipolo/pushtape_connect.git"
projects[pushtape_connect][download][branch] = "7.x-2.x"
projects[pushtape_connect][subdir] = pushtape_apps

;projects[pushtape_events][location] = http://apps.rosenstrauch.com/fserver
projects[pushtape_events][type] = "module"
projects[pushtape_events][download][type] = "git"
projects[pushtape_events][download][url] = "git://github.com/discipolo/pushtape_events.git"
projects[pushtape_events][download][branch] = "7.x-2.x"
projects[pushtape_events][subdir] = pushtape_apps

;projects[pushtape_news][location] = http://apps.rosenstrauch.com/fserver
projects[pushtape_news][type] = "module"
projects[pushtape_news][download][type] = "git"
projects[pushtape_news][download][url] = "git://github.com/discipolo/pushtape_news.git"
projects[pushtape_news][download][branch] = "7.x-2.x"
projects[pushtape_news][subdir] = pushtape_apps

projects[omega] = 3.1

;projects[omega_pushtape][location] = http://apps.rosenstrauch.com/fserver
projects[omega_pushtape][type] = "theme"
projects[omega_pushtape][download][type] = "git"
projects[omega_pushtape][download][url] = "http://git.drupal.org/sandbox/discipolo/1474174.git"
projects[omega_pushtape][download][branch] = "7.x-1.x"