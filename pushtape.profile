<?php
/**
 * Implements hook_install_configure_form_alter()
 */
function pushtape_install_configure_form_alter(&$form, &$form_state) {
  $form['site_information']['site_name']['#default_value'] = 'Pushtape'; 
  $form['site_information']['site_mail']['#default_value'] = 'admin@'. $_SERVER['HTTP_HOST']; 
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
  $form['admin_account']['account']['mail']['#default_value'] = 'admin@'. $_SERVER['HTTP_HOST']; 
}

/**
 * Implements hook_init
 */
function pushtape_init() {

}

/**
 * Implements hook_form_alter().
 *
 * Allows the profile to alter the site-configuration form. This is
 * called through custom invocation, so $form_state is not populated.
 */
function pushtape_form_alter(&$form, $form_state, $form_id) {

}


/**
 * Implements hook_install_tasks()
 */
function pushtape_install_tasks($install_state) {
  // Kick off the tasks
  $tasks = array();

  // Summon the power of the Apps module
  require_once(drupal_get_path('module', 'apps') . '/apps.profile.inc');

  // Setup a task to verify capability to run apps
  $tasks['pushtape_apps_check'] = array(
    'display_name' => t('Enable apps support'),
    'type' => 'form',
  );

  // Setup the Panopoly Apps install task
  $panopoly_server = array(
    'machine name' => 'panopoly',
    'default apps' => array(
      'panopoly_admin',
      'panopoly_core',
      'panopoly_images',
      'panopoly_magic',
      'panopoly_pages',
      'panopoly_theme',
      'panopoly_widgets',
      'panopoly_wysiwyg',
    ),
    'required apps' => array(
      'panopoly_core',
    ),
  );
  $tasks = $tasks + apps_profile_install_tasks($install_state, $panopoly_server);
  $tasks['apps_profile_apps_select_form_panopoly']['display_name'] = t('Install apps for Panopoly');

  // Setup the Pushtape Apps install task
  $pushtape_server = array(
    'machine name' => 'pushtape',
    'default apps' => array(
      'pushtape_core',
      ),
    'required apps' => array(
      'pushtape_core',
    ),
    'default content callback' => 'pushtape_default_content',
  );
  $tasks = $tasks + apps_profile_install_tasks($install_state, $pushtape_server);
  $tasks['apps_profile_apps_select_form_pushtape']['display_name'] = t('Install apps for Pushtape');

  // Setup the theme selection and configuration tasks
  $tasks['pushtape_theme_form'] = array(
    'display_name' => t('Choose a theme'),
    'type' => 'form',
  );
  $tasks['pushtape_theme_configure_form'] = array(
    'display_name' => t('Configure theme settings'),
    'type' => 'form',
  );

  // Setup the prepare task to close it out
  $tasks['pushtape_prepare'] = array(
    'display_name' => t('Prepare site'),
    'type' => 'form',
  );

  return $tasks;
}

/**
 * Implements hook_form_FORM_ID_alter()
 */
function pushtape_form_install_configure_form_alter(&$form, $form_state) {

  // Hide some messages from various modules that are just too chatty!
  drupal_get_messages('status');
  drupal_get_messages('warning');

  // Set reasonable defaults for site configuration form
  $form['site_information']['site_name']['#default_value'] = 'Department of Pushtape';
  $form['site_information']['site_mail']['#default_value'] = 'admin@'. $_SERVER['HTTP_HOST']; 
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
  $form['admin_account']['account']['mail']['#default_value'] = 'admin@'. $_SERVER['HTTP_HOST'];
  $form['server_settings']['site_default_country']['#default_value'] = 'US';
  $form['server_settings']['date_default_timezone']['#default_value'] = 'America/Los_Angeles'; // West coast, best coast
}

/**
 * Implements hook_form_FORM_ID_alter()
 */
function pushtape_form_apps_profile_apps_select_form_alter(&$form, $form_state) {

  // For some things there are no need
  $form['apps_message']['#access'] = FALSE;
  $form['apps_fieldset']['apps']['#title'] = NULL;

  // Improve style of apps selection form
  if (isset($form['apps_fieldset'])) {
    $options = array();
    foreach($_SESSION['apps_manifest'] as $name => $app) {
      if ($name != '#theme') {
        $options[$name] = '<div class="app-icon">' . theme('image', array('path' => $app['logo']['path'], 'height' => '32', 'width' => '32')) . '</div><strong>' . $app['name'] . '</strong><div class="admin-options">' . $app['description'] . '</div>';
      }
    }
    ksort($options);
    $form['apps_fieldset']['apps']['#options'] = $options;
  }
}

/**
 * Implements hook_install_tasks_alter()
 */
function pushtape_install_tasks_alter(&$tasks, $install_state) {

  // Insert install task to set theme
  pushtape_maintaince_array_insert(
    $tasks, 
    'install_load_profile', array(
      'pushtape_set_theme' => array(
        'run' => INSTALL_TASK_RUN_IF_REACHED,
      ),
    )
  );

  // Since we only offer one language, define a callback to set this
  $tasks['install_select_locale']['function'] = 'pushtape_locale_selection';

  // Create a more fun finished page with our Pushtape Saurus
  $tasks['install_finished']['function'] = 'pushtape_finished_yah';
  $tasks['install_finished']['display_name'] = t('Finished!');
  $tasks['install_finished']['type'] = 'form';
}

/**
 * Task handler to set the language to English since that is the only one
 * we have at the moment.
 */
function pushtape_locale_selection(&$install_state) {
  $install_state['parameters']['locale'] = 'en';
}

/**
 * Implements hook_appstore_stores_info()
 */
function pushtape_apps_servers_info() {
  $profile = variable_get('install_profile', 'pushtape');
  $info =  drupal_parse_info_file(drupal_get_path('profile', $profile) . '/' . $profile . '.info');
  return array(
    /*'pushtape' => array(
      'title' => 'Pushtape',
      'description' => "Apps for Pushtape",
      'manifest' => 'http://koolkats.rosenstrauch.com/app/pushtape',
      'profile' => $profile,
      'profile_version' => isset($info['version']) ? $info['version'] : '7.x-2.x-panopolybased',
      'server_name' => $_SERVER['SERVER_NAME'],
      'server_ip' => $_SERVER['SERVER_ADDR'],
    ),*/
    'panopoly' => array(
      'title' => 'Panopoly',
      'description' => 'Apps for Panopoly',
      'manifest' => 'http://apps.getpantheon.com/panopoly',
      'profile' => $profile,
      'profile_version' => isset($info['version']) ? $info['version'] : '7.x-1.x',
      'server_name' => $_SERVER['SERVER_NAME'],
      'server_ip' => $_SERVER['SERVER_ADDR'],
    ),
  );
}

/**
 * Apps installer default content callback.
 *
 * Adapted from openenterprise_default_content()
 */
function pushtape_default_content(&$modules) {
  $files = system_rebuild_module_data();
  foreach($modules as $module) {
    // This assumes a pattern MYMODULE_democontent which is probably not always true. Might be 
    // better to check $_SESSION['apps_manifest'] and check to see if this exists:
    // function_exists($_SESSION['module']['configure form'])
    if (isset($files[$module . '_democontent'])) {
      $modules[] = $module . '_democontent';
    }
  }
}

/**
 * Task handler to set the awesome maintenance theme
 */
function pushtape_set_theme() {
  $themes = list_themes();
  $theme = $themes['omega_pushtape'];
  _drupal_theme_initialize($theme);
}

/**
 * Form to check to see if Apps support is possible
 */
function pushtape_apps_check($form, &$form_state) {
  $form = array();

  // Set the title
  drupal_set_title('Enable Support for Apps');

  $form['openingtext'] = array(
    '#markup' => '<p>' . t('Apps uses the same mechanism for installing modules as the update module in core. This depends on certain php extensions to be installed on your server. Below is the documentation for the various methods of installing.') . '</p>',
  );

  $form['pantheon'] = array(
    '#title' => t('Pantheon'),
    '#type' => 'fieldset',
    '#description' => theme('image', array('path' => drupal_get_path('profile', 'pushtape') . '/images/enable-apps-pantheon.png')) . t('If you are installing Pushtape on Pantheon, you need to enable "On Server Development" to use apps.<br /><br />After you install your apps, you will need to use the "Commit" button to add them to the version control system.'),
  );

  $form['ftp'] = array(
    '#title' => t('FTP'),
    '#type' => 'fieldset',
    '#description' => 'In order to install via ftp, you must have the ftp php extension enabled. Most apache2/php installs have this by default which is by it probably shows up on most installs. <br /><br />You may run into a server that doesn\'t have ftp so then you will need to install it or use an alternative method. See <a href="http://us2.php.net/manual/en/book.ftp.php">http://us2.php.net/manual/en/book.ftp.php</a> for how to install the ftp php extension. You will also need an ftp username and password that has rights to write to your site directory on your server. Be aware that FTP is not an encrypted protocol and your credentials will be transmitted in the clear.',
  );

  $form['ssh'] = array(
    '#title' => t('SSH'),
    '#type' => 'fieldset',
    '#description' => 'In order to install via ssh, you must have the ssh2 php extension installed and enabled. This does not come by default with many apache2/php installs so it commonly needs to be added. <br /><br />See <a href="http://us2.php.net/manual/en/book.ssh2.php">http://us2.php.net/manual/en/book.ssh2.php</a> for how to install the ssh2 php extension. You will also need a username and password of a user that can ssh into the server and has write permissions to your site directory on your server.',
  );

  $form['webserver'] = array(
    '#title' => 'Webserver Direct Install',
    '#type' => 'fieldset',
    '#description' => 'In order to install directly to the sites/all/modules directory it needs to be writable. In order to do this go to the root of your drupal install and type <strong>sudo chmod -R 777 sites/all/modules</strong>. Be aware that there are security issues with leaving your site in this state.',
  );

  $form['continue'] = array(
    '#type' => 'submit',
    '#value' => 'Continue',
  );

  return $form;
}
                
/**
 * Form to choose the starting theme from list of available options
 */
function pushtape_theme_form($form, &$form_state) {

  // Set the page title
  drupal_set_title(t('Choose a theme!'));
  
  // Create list of theme options, minus admin + testing + starter themes
  $themes = array();
  foreach(system_rebuild_theme_data() as $theme) {
    if (!in_array($theme->name, array('test_theme', 'update_test_basetheme', 'update_test_subtheme', 'block_test_theme', 'stark', 'seven', 'pushtape_maintenance'))) {
      $themes[$theme->name] = theme('image', array('path' => $theme->info['screenshot'])) . '<strong>' . $theme->info['name'] . '</strong><br><p><em>' . $theme->info['description'] . '</em></p>';
    }
  }

  $form['theme'] = array(
    '#title' => t('Starting Theme'),
    '#type' => 'radios',
    '#options' => $themes,
    '#default_value' => 'pushtape_default',
  );
  
  $form['actions'] = array(
   '#prefix' => '<div class="form-actions">',
   '#suffix' => '</div>',
  );

  $form['actions']['submit'] = array(
    '#type' => 'submit',
    '#value' => 'Choose theme',
  );

  return $form;
}

/**
 * Form submit handler to select the theme
 */
function pushtape_theme_form_submit($form, &$form_state) {
  
  // Enable and set the theme of choice
  $theme = $form_state['input']['theme'];
  theme_enable(array($theme));
  variable_set('theme_default', $theme);
 
  // Flush theme caches so things are right
  system_rebuild_theme_data();
  drupal_theme_rebuild();
}

/**
 * Form to choose the starting theme
 */
function pushtape_theme_configure_form($form, &$form_state) {

  // Set the title
  drupal_set_title(t('Configure theme settings!'));
  
  $theme = variable_get('theme_default');
  ctools_include('system.admin', 'system', '');
  $form = system_theme_settings($form, $form_state, $theme); 
  return $form;
}

/**
 * Form to talk about preparing the site for prime time
 */
function pushtape_prepare($form, &$form_state) {
  
  // Set the title 
  drupal_set_title(t('Prepare Site'));
  
  $form = array();

  $form['openingtext'] = array(
    '#markup' => '<h2>' . t('Pushtape now needs to do a bit more Drupal magic to get everything setup.') . '</h2>',
  );
  
  $form['actions'] = array(
   '#prefix' => '<div class="form-actions">',
   '#suffix' => '</div>',
  );

  $form['actions']['submit'] = array(
    '#type' => 'submit',
    '#value' => 'Prepare your site',
  );

  return $form;
}

/**
 * Submit form to prepare site for prime time
 */
function pushtape_prepare_submit($form, &$form_state) {
  // Flush all caches to ensure that any full bootstraps during the installer
  // do not leave stale cached data, and that any content types or other items
  // registered by the install profile are registered correctly.
  drupal_flush_all_caches();

  // Remember the profile which was used.
  variable_set('install_profile', drupal_get_profile());

  // Install profiles are always loaded last
  db_update('system')
    ->fields(array('weight' => 1000))
    ->condition('type', 'module')
    ->condition('name', drupal_get_profile())
    ->execute();

  // Cache a fully-built schema.
  drupal_get_schema(NULL, TRUE);

  // Run cron to populate update status tables (if available) so that users
  // will be warned if they've installed an out of date Drupal version.
  // Will also trigger indexing of profile-supplied content or feeds.
  drupal_cron_run();
}

/**
 * Form to finish it all out and send us on our way
 */
function pushtape_finished_yah($form, &$form_state) {
  $form = array();
  
  //set the title
  drupal_set_title(st('Congratulations!'));
  
  //set the guidelines
  variable_set('pushtape_install_guidelines', '');

  $form['openingtext'] = array(
    '#markup' => '<h2 class="bubble">' . t('Congratulations, you just installed Pushtape!') . '<span class="tip"></span></h2>',
  );
  
  $form['openacademysaurus'] = array(
    '#markup' => theme('image', array('path' => drupal_get_path('profile', 'pushtape') . '/images/openacademysaurus-success.png', 'attributes' => array('class' => array('openacademysaurus')))),
  );
  
  $form['actions'] = array(
   '#prefix' => '<div class="form-actions">',
   '#suffix' => '</div>',
  );

  $form['actions']['submit'] = array(
    '#type' => 'submit',
    '#value' => 'Visit your new site!',
  );

  return $form;
}

/**
 * Submit form to finish it out and send us on our way!
 */
function pushtape_finished_yah_submit($form, &$form_state) {
  //clean up variables
  variable_del('pushtape_install_guidelines');

  // Once more for good measure
  drupal_flush_all_caches();

  // And away we go
  drupal_goto('<front>');
}

/**
* Helper function to adjust an array and put an element right where we want it. 
*/
function pushtape_maintaince_array_insert(&$array, $key, $insert_array, $before = FALSE) {
  $done = FALSE;
  foreach ($array as $array_key => $array_val) {
    if (!$before) {
      $new_array[$array_key] = $array_val;
    }
    if ($array_key == $key && !$done) {
      foreach ($insert_array as $insert_array_key => $insert_array_val) {
        $new_array[$insert_array_key] = $insert_array_val;
      }
      $done = TRUE;
    }
    if ($before) {
      $new_array[$array_key] = $array_val;
    }
  }
  if (!$done) {
    $new_array = array_merge($array, $insert_array);
  }
  // Put the new array in the place of the original.
  $array = $new_array;
}