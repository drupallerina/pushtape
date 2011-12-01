core = 7.x

api = 2


; Modules
projects[admin_menu][version] = "2.0-beta3"
projects[advanced_help][version] = "1.0"
projects[apps][version] = "1.0-beta4"
;projects[backup_migrate][version] = "2.2"
projects[boxes][version] = "1.0-beta6"
projects[ctools][version] = "1.0-rc1"
;projects[computed_field][version] = "1.x-dev"
projects[context][version] = "3.0-beta2"
projects[context][patch][] = "http://drupal.org/files/issues/custom_blocks_arent_editable-make.patch"
projects[date][version] = "2.x-dev"
projects[devel][version] = "1.2"
projects[diff][version] = "2.0"
projects[download_file][version] = "1.1"
projects[entity][version] = "1.0-rc1"
projects[features][version] = "1.0-beta4"
projects[field_group][version] = "1.1"
projects[follow][version] = "1.0-alpha1"
projects[follow][patch][] = "http://drupal.org/files/1184896-follow-add-ctools-export.patch"
projects[google_analytics][version] = 1.2
projects[l10n_update][version] = "1.0-beta2"
projects[libraries][version] = "1.0"
projects[mailing_list][version] = "1.x-dev"
projects[mailing_list][patch][] = "http://drupal.org/files/issues/1072054-mail.patch"
;projects[menu_block][version] = "2.2"
;projects[nodequeue][version] = "2.0-beta1"
projects[om_tools][version] = "2.12"
projects[pathauto][version] = "1.0"
projects[strongarm][version] = "2.0-beta4"
projects[sweaver][version] = "1.1"
;projects[title][version] = "1.0-alpha2"
projects[token][version] = "1.0-beta7"
;projects[taxonomy_display][version] = "1.0"
projects[transliteration][version] = "3.0"
projects[typogrify][version] = "1.0-rc2"
projects[views][version] = "3.0-rc3"
projects[views_slideshow][version] = "3.0"
projects[wysiwyg][version] = "2.x-dev"
projects[wysiwyg][patch][] = "http://drupal.org/files/835682_22_remove_path_to_theme.patch"

; Custom features
projects[pushtape_features][version] = "1.x-dev"

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
projects[om][type] = "theme"
projects[om_admin][type] = "theme"

