<?php
/**
 * @file
 * pushtape_playlists.features.filter.inc
 */

/**
 * Implements hook_filter_default_formats().
 */
function pushtape_playlists_filter_default_formats() {
  $formats = array();

  // Exported format: html
  $formats['html'] = array(
    'format' => 'html',
    'name' => 'html',
    'cache' => '1',
    'status' => '1',
    'weight' => '0',
    'filters' => array(
      'filter_htmlcorrector' => array(
        'weight' => '10',
        'status' => '1',
        'settings' => array(),
      ),
    ),
  );

  return $formats;
}
