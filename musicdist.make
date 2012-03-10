core = 7.x

api = 2

;includes[] = http://drupalcode.org/project/buildkit.git/blob_plain/refs/heads/7.x-2.x:/drupal-org.make

; Modules
projects[media][version] = "2.x-dev"
projects[file_entity][version] = "2.x-dev"
projects[context][version] = "3.0-beta2"

;projects[apps][version] = "1.0-beta4"
projects[date][version] = "2.x-dev"
projects[calendar][version] = "3.0-alpha1"
projects[plupload][version] = "1.0-beta4"
projects[wysiwyg][version] = "2.x-dev"
projects[wysiwyg][patch][] = "http://drupal.org/files/835682_22_remove_path_to_theme.patch"
projects[soundmanager2][version] = "2.x-dev"
projects[download_file][version] = "1.1"

; Apps

projects[debut][version] = "1.x-dev"
;projects[debut_link][version] = "1.0-beta1"
;projects[debut_media][version] ="1.x-dev"
projects[debut_event][version] ="1.x-dev"

;includes[debut_event] = "http://drupalcode.org/project/debut_event.git/blob_plain/refs/heads/7.x-1.x:/debut_event.make.inc"

;Devel tools

projects[diff][version] = "2.0"
projects[libraries][version] = "2.0-alpha2"
projects[strongarm][version] = "2.0-beta4"
projects[devel][version] = "1.2"
projects[coder][version] = "1.0"
projects[subprofiles][version] = "1.0"
projects[omega_tools][version] = "3.0-rc4"

; Drupalgardensmodules for import

projects[follow][version] = "1.0-alpha1"
projects[follow][patch][] = "http://drupal.org/files/1184896-follow-add-ctools-export.patch"

projects[mailing_list][version] = "1.x-dev"
projects[mailing_list][patch][] = "http://drupal.org/files/issues/1072054-mail.patch"

; Libraries

; Plupload
libraries[plupload][download][type] = "get"
libraries[plupload][download][url] = "https://github.com/downloads/moxiecode/plupload/plupload_1_5_2.zip"
libraries[plupload][directory_name] = "plupload"
libraries[plupload][destination] = "modules/contrib/plupload"

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
projects[omega][type] = "theme"

projects[omegapushtape][download][type] = "git"
projects[omegapushtape][download][url] = "discipolo@git.drupal.org:sandbox/discipolo/1474174.git"
projects[omegapushtape][download][branch] = "master"

;patches

projects[pushtape_features][patch][] = "http://drupal.org/files/pushtapemusic_featuretype-1.patch"

