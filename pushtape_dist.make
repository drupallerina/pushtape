core = 7.x

api = 2

;includes[] = http://drupalcode.org/project/buildkit.git/blob_plain/refs/heads/7.x-2.x:/drupal-org.make

; Modules

projects[admin_menu][version] = "3.0-rc1"
projects[advanced_help][version] = "1.0"
projects[apps][version] = "1.0-beta4"
;projects[backup_migrate][version] = "2.2"
projects[boxes][version] = "1.0-beta6"
;projects[computed_field][version] = "1.x-dev"
projects[context][version] = "3.0-beta2"
projects[context][patch][] = "http://drupal.org/files/issues/custom_blocks_arent_editable-make.patch"
projects[date][version] = "2.x-dev"
projects[devel][version] = "1.2"
projects[diff][version] = "2.0"
projects[download_file][version] = "1.1"
projects[entity][version] = "1.0-rc1"
projects[field_group][version] = "1.1"
projects[file_entity][version] = 2.0-unstable2
projects[follow][version] = "1.0-alpha1"
projects[follow][patch][] = "http://drupal.org/files/1184896-follow-add-ctools-export.patch"
projects[google_analytics][version] = 1.2
projects[jplayer][version] = "2.x-dev"
projects[l10n_update][version] = "1.0-beta2"
projects[libraries][version] = "1.0"
projects[mailing_list][version] = "1.x-dev"
projects[mailing_list][patch][] = "http://drupal.org/files/issues/1072054-mail.patch"
projects[media_youtube][version] = "1.0-alpha5"
;projects[menu_block][version] = "2.2"
projects[multiform][version] = "1.0-beta2"
;projects[nodequeue][version] = "2.0-beta1"
projects[om_tools][version] = "2.12"
projects[plupload][version] = "1.0-beta3"
projects[strongarm][version] = "2.0-beta4"
projects[sweaver][version] = "1.1"
;projects[title][version] = "1.0-alpha2"
;projects[taxonomy_display][version] = "1.0"
projects[transliteration][version] = "3.0"
projects[typogrify][version] = "1.0-rc2"
projects[views_slideshow][version] = "3.0"
projects[wysiwyg][version] = "2.x-dev"
projects[wysiwyg][patch][] = "http://drupal.org/files/835682_22_remove_path_to_theme.patch"

;Devtools
projects[devel][version] = "1.2"
projects[coder][version] = "1.0"
projects[profiler_builder][version] = "1.0-alpha2"
projects[defaultconfig][version] = "1.0-alpha4"
;projects[ftools][version] = "1.1" // enable only in local dev
projects[subprofiles][version] = "1.0"

; Custom features
projects[debut][version] = "1.0-beta3"
projects[debut_link][version] = "1.0-beta1"
projects[debut_media][version] ="1.x-dev"
projects[debut_event][version] ="1.0-beta4"
;projects[pushtape_features][version] = "1.x-dev"

;sandboxes

projects[mupload][type] = module
projects[mupload][download][type] = "git"
projects[mupload][download][url] = "http://git.drupal.org/sandbox/vingborg/1138512.git"
projects[mupload][download][branch] = "master"

; Libraries



libraries[jplayer][download][type] = "get"
libraries[jplayer][download][url] = "http://www.happyworm.com/jquery/jplayer/latest/jQuery.jPlayer.1.2.0.zip"

projects[getid3][subdir] = contrib
libraries[getid3][download][type] = "get"
libraries[getid3][download][url] = "http://downloads.sourceforge.net/project/getid3/getID3%28%29%201.x/1.7.9/getid3-1.7.9.zip"



; jQuery UI
libraries[jquery_ui][download][type] = "get"
libraries[jquery_ui][download][url] = "http://jqueryui.com/download/jquery-ui-1.8.16.custom.zip"
libraries[jquery_ui][directory_name] = "jquery.ui"
libraries[jquery_ui][destination] = "modules/contrib/jquery_ui"

; CKEditor
libraries[ckeditor][download][type]= "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor%20for%20Drupal/CKEditor%203.6.2%20for%20Drupal/ckeditor_3.6.2_for_drupal_7.zip"
libraries[ckeditor][directory_name] = "ckeditor"
libraries[ckeditor][destination] = "libraries"

;Profiler
libraries[profiler][download][type] = "get"
libraries[profiler][download][url] = "http://ftp.drupal.org/files/projects/profiler-7.x-2.0-beta1.tar.gz"

;Themes
projects[om][type] = "theme"
projects[om_admin][type] = "theme"
projects[omega][type] = "theme"