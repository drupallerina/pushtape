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

;version override
projects[defaultcontent][version] = "2.x-dev"

includes[panopoly] = http://drupalcode.org/project/panopoly.git/blob_plain/refs/heads/7.x-1.x:/drupal-org.make
;include panopoly make instead of being behind ...
include[] = http://drupalcode.org/project/panopoly.git/blob_plain/refs/heads/7.x-1.x:/drupal-org.make

; Defining a theme is no different.

projects[omega] = 3.1

projects[omega_pushtape][type] = "theme"
projects[omega_pushtape][download][type] = "git"
projects[omega_pushtape][download][url] = "http://git.drupal.org/sandbox/discipolo/1474174.git"
projects[omega_pushtape][download][branch] = "7.x-1.x"

projects[pushtape_wireframe][type] = "theme"
projects[pushtape_wireframe][download][type] = "git"
projects[pushtape_wireframe][download][url] = "http://git.drupal.org/sandbox/gusaus/1547514.git"
projects[pushtape_wireframe][download][branch] = "master"