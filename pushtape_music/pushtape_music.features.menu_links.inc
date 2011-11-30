<?php
/**
 * @file
 * pushtape_music.features.menu_links.inc
 */

/**
 * Implements hook_menu_default_menu_links().
 */
function pushtape_music_menu_default_menu_links() {
  $menu_links = array();

  // Exported menu link: main-menu:releases
  $menu_links['main-menu:releases'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'releases',
    'router_path' => 'releases',
    'link_title' => 'Albums',
    'options' => array(),
    'module' => 'system',
    'hidden' => '1',
    'external' => '0',
    'has_children' => '0',
    'expanded' => '0',
    'weight' => '-50',
    'parent_path' => 'music',
  );
  // Exported menu link: management:node/add/track
  $menu_links['management:node/add/track'] = array(
    'menu_name' => 'management',
    'link_path' => 'node/add/track',
    'router_path' => 'node/add/track',
    'link_title' => 'New Track',
    'options' => array(
      'attributes' => array(
        'title' => 'New track...',
      ),
    ),
    'module' => 'menu',
    'hidden' => '0',
    'external' => '0',
    'has_children' => '0',
    'expanded' => '0',
    'weight' => '-50',
    'parent_path' => 'admin',
  );
  // Translatables
  // Included for use with string extractors like potx.
  t('Albums');
  t('New Track');


  return $menu_links;
}
