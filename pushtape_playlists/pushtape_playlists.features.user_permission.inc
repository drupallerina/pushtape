<?php
/**
 * @file
 * pushtape_playlists.features.user_permission.inc
 */

/**
 * Implements hook_user_default_permissions().
 */
function pushtape_playlists_user_default_permissions() {
  $permissions = array();

  // Exported permission: create playlist content
  $permissions['create playlist content'] = array(
    'name' => 'create playlist content',
    'roles' => array(
      0 => 'artist',
    ),
    'module' => 'node',
  );

  // Exported permission: delete any playlist content
  $permissions['delete any playlist content'] = array(
    'name' => 'delete any playlist content',
    'roles' => array(
      0 => 'artist',
    ),
    'module' => 'node',
  );

  // Exported permission: delete own playlist content
  $permissions['delete own playlist content'] = array(
    'name' => 'delete own playlist content',
    'roles' => array(
      0 => 'artist',
    ),
    'module' => 'node',
  );

  // Exported permission: edit any playlist content
  $permissions['edit any playlist content'] = array(
    'name' => 'edit any playlist content',
    'roles' => array(
      0 => 'artist',
    ),
    'module' => 'node',
  );

  // Exported permission: edit own playlist content
  $permissions['edit own playlist content'] = array(
    'name' => 'edit own playlist content',
    'roles' => array(
      0 => 'artist',
    ),
    'module' => 'node',
  );

  return $permissions;
}
