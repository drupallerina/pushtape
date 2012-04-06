<?php
/**
 * @file views-view-table.tpl.php
 * Template to display a view as a table.
 *
 * - $title : The title of this group of rows.  May be empty.
 * - $header: An array of header labels keyed by field id.
 * - $header_classes: An array of header classes keyed by field id.
 * - $fields: An array of CSS IDs to use for each field id.
 * - $class: A class or classes to apply to the table, based on settings.
 * - $row_classes: An array of classes to apply to each row, indexed by row
 *   number. This matches the index in $rows.
 * - $rows: An array of row items. Each row is an array of content.
 *   $rows are keyed by row number, fields within rows are keyed by field ID.
 * - $field_classes: An array of classes to apply to each field, indexed by
 *   field id, then row number. This matches the index in $rows.
 * @ingroup views_templates
 */
$row_keys = array_keys($rows);
if ($first_row = $view->result[$row_keys[0]]) { 
  $playlist_nid = $first_row->nid;
}

?>
<div class="playlist-wrap">
  <div class="playlist-header <?php print ' pushtape-playlists-playlist-' . $playlist_nid; ?>">
    <?php if (!empty($title)): ?>
      <h2 class="playlist-title"><a href="#" class="collapsed"><?php print $title; ?></a></h2>
    <?php endif; ?>
    <ul class="playlist-links">
      <li class="playlist-edit"><a class="pushtape-playlists-inline" href="<?php print url('mp/nojs/' . $playlist_nid . '/edit'); ?>"><img src="/sites/all/themes/acq_monitorpop/images/editthislist.png"><span>edit</span></a></li>
      <li class="playlist-delete"><a class="pushtape-playlists-inline" href="<?php print url('mp/nojs/' . $playlist_nid . '/delete'); ?>"><img src="/sites/all/themes/acq_monitorpop/images/deletethislist.png"><span>delete</span></a></li>
      <li class="playlist-zip"><a href="<?php print url('zip_download/' . $playlist_nid); ?>"><img src="/sites/all/themes/acq_monitorpop/images/downloadthislist.png"><span>download</span></a></li>
    </ul>
  </div>
  <div class="playlist-table-wrap">
    <table <?php if ($classes) { print 'class="'. $classes . ' pushtape-playlists-row-playlist-' . $playlist_nid  . '" '; } ?><?php print $attributes; ?>>
      <thead>
        <tr>
          <?php $i=0; ?>
          <?php foreach ($header as $field => $label): ?>
            <?php
            if(in_array($field, array('field_audio','nothing','field_audio_1','nothing_1'))) {
              $width=40;
              $pct=1;
            }
            elseif(in_array($field,array('title','term_node_tid_5'))) {
              $width=150;
              $pct=40;
            }
            ?>
            <th width="<?php print $pct; ?>%"<?php if ($header_classes[$field]) { print ' class="'. $header_classes[$field] . '" '; } ?> style="white-space:nowrap;">
              <?php print $label; ?>
              <br /><img src="/sites/all/themes/acq_monitorpop/images/spacer.gif" width="<?php print $width; ?>" height="1">
            </th>
            <?php $i++; ?>
          <?php endforeach; ?>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($rows as $count => $row): ?>
          <?php if ($row['title']): ?>
          <tr class="<?php print implode(' ', $row_classes[$count]); ?>">
            <?php $i=0; ?>
            <?php foreach ($row as $field => $content): ?>
              <?php $content = str_replace(urlencode('[token]'), drupal_get_token($playlist_nid), $content); ?>
              <td <?php if ($field_classes[$field][$count]) { print 'class="'. $field_classes[$field][$count] . '" '; } ?><?php print drupal_attributes($field_attributes[$field][$count]); ?>>
                <?php print $content; ?>
              </td>
            <?php endforeach; ?>
          </tr>
          <?php else: ?>
            <tr><td colspan="<?php print $i; ?>">You have not added any tracks to this playlist. <a href="library">Browse tracks from the library</a></td></tr>
          <?php endif; ?>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>
</div>
