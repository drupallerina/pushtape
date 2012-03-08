core = 7.x

api = 2

;includes[] = http://drupalcode.org/project/buildkit.git/blob_plain/refs/heads/7.x-2.x:/drupal-org.make

; Modules

projects[apps][version] = "1.0-beta4"
projects[date][version] = "2.x-dev"
projects[calendar][version] = "3.0-alpha1"
projects[plupload][version] = "1.0-beta3"
projects[wysiwyg][version] = "2.x-dev"
projects[wysiwyg][patch][] = "http://drupal.org/files/835682_22_remove_path_to_theme.patch"

; Apps

projects[debut][version] = "1.x-dev"
;projects[debut_link][version] = "1.0-beta1"
;projects[debut_media][version] ="1.x-dev"
projects[debut_event][version] ="1.x-dev"

;Devel tools

projects[diff][version] = "2.0"
projects[libraries][version] = "1.0"
projects[strongarm][version] = "2.0-beta4"
projects[devel][version] = "1.2"
projects[coder][version] = "1.0"
projects[subprofiles][version] = "1.0"

; Drupalgardensmodules for import

projects[follow][version] = "1.0-alpha1"
projects[follow][patch][] = "http://drupal.org/files/1184896-follow-add-ctools-export.patch"

projects[mailing_list][version] = "1.x-dev"
projects[mailing_list][patch][] = "http://drupal.org/files/issues/1072054-mail.patch"

; Libraries

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