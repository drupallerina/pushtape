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
    'link_title' => 'Releases',
    'options' => array(),
    'module' => 'system',
    'hidden' => '0',
    'external' => '0',
    'has_children' => '0',
    'expanded' => '0',
    'weight' => '-1',
  );
  // Translatables
  // Included for use with string extractors like potx.
  t('Releases');


  return $menu_links;
}
