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

projects[features] = 1.0-beta6
projects[pathauto] = 1.0
projects[references] = 2.0
projects[ctools] = 1.0-rc1
projects[token] = 1.0-rc1
projects[views] = 3.1
projects[media] = 1.0-rc3
projects[pushtape_features] = 1.4

;@todo - Move this to the libraries directory
;library[profiler] = 2.0-beta1

; For pre-releases, like Image 6.x-1.0-beta3, use this format:
;projects[image] = 1.0-beta3

; projects[pathauto] = 1.2
; projects[token] = 1.12
; projects[logintoboggan] = 1.6


; To define more attributes for a specific project than just the version,
; create another layer of array keys. In the example below, both the
; projects will be placed in a subdirectory of the modules folder.
; Note that if the long form is used, the version key must be defined
; for the project!
; projects[cck][version] = 2.6
; projects[cck][subdir] = cck_related_modules
; projects[filefield][version] = 3.2
; projects[filefield][subdir] = cck_related_modules

; Defining a theme is no different.
projects[omega] = 3.0