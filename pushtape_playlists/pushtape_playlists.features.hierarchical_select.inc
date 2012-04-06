<?php
/**
 * @file
 * pushtape_playlists.features.hierarchical_select.inc
 */

/**
 * Implements hook_hierarchical_select_default_configs().
 */
function pushtape_playlists_hierarchical_select_default_configs() {
$configs = array();
$config = array(
  'config_id'       => 'taxonomy-1',
  'save_lineage'    => 0,
  'enforce_deepest' => 0,
  'entity_count'    => 0,
  'require_entity'  => 0,
  'resizable'       => 1,
  'level_labels' => array(
    'status' => 0,
    'labels' => array(
    ),
  ),
  'dropbox' => array(
    'status'    => 0,
    'title'     => 'All selections',
    'limit'     => 0,
    'reset_hs'  => 1,
  ),
  'editability' => array(
    'status' => 0,
    'item_types' => array(
    ),
    'allowed_levels' => array(
    ),
    'allow_new_levels' => 0,
    'max_levels'       => 3,
  ),
);

$configs['taxonomy-1'] = $config;
return $configs;
}
