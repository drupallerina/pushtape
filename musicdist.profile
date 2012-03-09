<?php

function musicdist_theme($existing, $type, $theme, $path) {
  return array(
    'musicdist_pushtape_feature' => array(
      'variables' => array('element' => NULL),
    ),
  );
}

function musicdist_install_tasks() {
  return array(
    'musicdist_pick_features_form' => array(
      'display_name' => st('Configure PushTape'),
      'type' => 'form',
    ),
    'musicdist_install_features' => array(
      'display_name' => st('Install PushTape features'),
      'type' => 'batch',
    ),
    'musicdist_finish' => array(
      'display_name' => st('Apply configuration'),
      'display' => TRUE,
      'type' => 'batch',
    ),
  );
}

/**
 * Implements hook_apps_servers_info().

function musicdist_apps_servers_info() {
  return array(
    'PushTape' => array(
      'title' => t('PushTape'), //the title to be use for the server
      'description' => t('PushTape products can be used to build audio focused media web sites.'),
      'manifest' => 'http://pushtape.org/apps.json', // the location of the  json manifest
    ),
  );
} */

/**
 * Feature selection form. The user get's to select the feature she wants
 * to have on the site during installation.
 */
function musicdist_pick_features_form($form, &$form_state, &$install_state) {
  $features = array();
  drupal_set_title(st('Configure PushTape'));
  $modules = $form_state['modules'] = system_rebuild_module_data();

  foreach ($modules as $module_name => $module) {
    if (isset($module->info['musicdist_type'])) {
      $features[$module->info['musicdist_type']][$module_name] = $module;
    }
  }
  $form['welcome']['#markup'] = '<h1 class="title">Select features</h1><p>' . st('Welcome to PushTape! PushTape comes with a wide array
    of features and depending on which you choose, you can create different kinds of sites. The features are
    presented below.') . '</p>';
  $form['features'] = array(
    '#tree' => TRUE,
  );
  $types = module_invoke_all('musicdist_feature_types');
  foreach ($types as $type_name => $type) {
    if (isset($features[$type_name])) {
      $form['features'][$type_name] = array(
        '#type' => 'fieldset',
        '#title' => $type['title'],
        '#collapsible' => TRUE,
        '#collapsed' => isset($type['collapsed']) ? $type['collapsed'] : TRUE,
        '#description' => isset($type['description']) ? $type['description'] : '',
      );
      foreach ($features[$type_name] as $name => $feature) {
        $form['features'][$type_name][$name] = array(
          '#type' => 'fieldset',
          '#title' => $feature->info['name'],
          '#description' => $feature->info['description'],
        );
        if (isset($feature->info['musicdist_screenshot'])) {
          $form['features'][$type_name][$name]['screenshot']['#markup'] = theme('image', array(
              'path' => drupal_get_path('module', $name) . '/' . $feature->info['musicdist_screenshot'],
              'width' => 500,
            )
          );
        }
        $form['features'][$type_name][$name]['enabled'] = array(
          '#type' => 'checkbox',
          '#title' => st('Enable this feature'),
        );
      }
    }
  }
  $form['actions'] = array('#type' => 'actions');
  $form['actions']['submit'] = array(
    '#type' => 'submit',
    '#value' => st('Save and continue'),
    '#weight' => 15,
  );
  return $form;
}

/**
 * Submit handler for feature picking form.
 */
function musicdist_pick_features_form_submit($form, &$form_state) {
  variable_set('musicdist_enable_features', $form_state['values']['features']);
}

/**
 * Install selected features from the previous section.
 */
function musicdist_install_features(&$install_state) {
  // Get all selected features out of the array.
  $feature_groups = variable_get('musicdist_enable_features', array());
  $modules = array();
  $module_data = system_rebuild_module_data();
  variable_del('musicdist_enable_features');
  foreach ($feature_groups as $group => $features) {
   foreach ($features as $feature => $info) {
     if ($info['enabled']) {
       $modules[] = $feature;
       // Add recommended modules.
       if (isset($module_data[$feature]->info['musicdist_recommended']) && is_array($module_data[$feature]->info['musicdist_recommended'])) {
         foreach($module_data[$feature]->info['musicdist_recommended'] as $recommended) {
           $modules[] = $recommended;
         }
       }
     }
   }
  }
  // Add pushtape recommended modules.
  if (isset($module_data['PushTape']->info['musicdist_recommended']) && is_array($module_data['PushTape']->info['musicdist_recommended'])) {
    foreach ($module_data['PushTape']->info['musicdist_recommended'] as $recommended) {
      $modules[] = $recommended;
    }
  }
  $module_list = array_flip(array_values($modules));
  while (list($module) = each($module_list)) {
    if (!isset($module_data[$module])) {
      // This module is not found in the filesystem, abort.
      break;
    }
    if ($module_data[$module]->status) {
      // Skip already enabled modules.
      unset($module_list[$module]);
      continue;
    }
    $module_list[$module] = $module_data[$module]->sort;
    // Add dependencies to the list, with a placeholder weight.
    // The new modules will be processed as the while loop continues.
    foreach (array_keys($module_data[$module]->requires) as $dependency) {
      if (!isset($module_list[$dependency])) {
        $module_list[$dependency] = 0;
      }
    }
  }
  // Sort the module list by pre-calculated weights.
  arsort($module_list);
  $module_list = array_keys($module_list);
  foreach ($module_list as $module) {
    $operations[] = array('_install_module_batch', array($module, $module_data[$module]->info['name']));
  }
  $batch = array(
    'operations' => $operations,
    'title' => st('Installing PushTape features'),
    'error_message' => st('The installation has encountered an error.'),
    'finished' => '_install_profile_modules_finished',
  );
  return $batch;
}

/**
 * Implements hook_musicdist_feature_types().
 */
function musicdist_pushtape_feature_types() {
  return array(
    'product' => array(
      'title' => st('Products'),
      'description' => st('A product is a way of distributing your content to your users.
        It could be a blog, a web newspaper or an rss feed.'),
      'collapsed' => FALSE,
    ),
    'content' => array(
      'title' => st('Content'),
      'description' => st('A content feature adds new types of content to your site.
        It could for instance be a blog or an article.'),
    ),
    'extension' => array(
      'title' => st('Extensions'),
      'description' => st('An extension feature adds new functionality to a content feature.
        It could for instance be a fact box for your articles.'),
    ),
  );
}

/**
 * Do things that needs to be done after all modules have been enabled.
 */
function musicdist_finish() {
  module_list(TRUE);
  drupal_flush_all_caches();
  // Rebuild default components.
  if (module_exists('defaultconfig')) {
    drupal_flush_all_caches();
    module_list(TRUE);
    return defaultconfig_rebuild_batch_defintion(
      st('Apply configuration'),
      st('The installation encountered an error')
    );
  }
  return array();
}
/**
 * Implement hook_install().
 *
 * Perform actions to set up the site for this profile.
 */
function musicdist_install() {
  include_once DRUPAL_ROOT . '/profiles/pushtape_dist/pushtape_dist.install';
  pushtape_install();
  !function_exists('profiler_v2') ? require_once('libraries/profiler/profiler.inc') : FALSE;
    profiler_v2('pushtape_dist');
      theme_enable(array('seven'));
  $variables = array(
    'admin_theme' => 'seven',
    'node_admin_theme' => 1,
  );
  foreach ($variables as $key => $variable) {
    variable_set($key, $variable);
  }
}

