<?php
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
}

