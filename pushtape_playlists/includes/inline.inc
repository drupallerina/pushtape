<?php

/**
 * @file
 * Implement an inline form using AJAX.
 */

function pushtape_playlists_inline_add_js() {
  // Provide a gate so we only do this once.
  static $done = FALSE;
  if ($done) {
    return;
  }
  
  // Hulu-style settings
  $bt_settings = array(
    'pushtape_playlists_inline' => 
      array(
        'fill' => '#BAC008',
        'strokeStyle' => '#666666', 
        'spikeLength' => 10,
        'spikeGirth' => 5,
        'width' => 'auto',
        'overlap' => 0,
        'centerPointY' => 1,
        'cornerRadius' => 4, 
        'cssStyles' => array(
          'fontFamily' => '"Lucida Grande",Helvetica,Arial,Verdana,sans-serif', 
          'fontSize' => '12px',
          'padding' => '10px 14px',
          'color' => '#fff'
        ),
        'shadow' => TRUE,
        'shadowColor' => 'rgba(0,0,0,.5)',
        'shadowBlur' => 8,
        'shadowOffsetX' => 4,
        'shadowOffsetY' => 4,
      )
  );
  drupal_add_js($bt_settings, 'setting');
  drupal_add_js('misc/jquery.form.js');
  drupal_add_js('misc/progress.js');
  drupal_add_js('misc/ajax.js');
  ctools_add_js('excanvas.compiled', 'pushtape_playlists', 'js/excanvas_r3');
  ctools_add_js('ajax-responder');
  ctools_add_js('inline', 'pushtape_playlists', 'js');
  ctools_add_js('acq_monitorpop', 'pushtape_playlists', 'js');
  ctools_add_js('jquery.bt.min', 'pushtape_playlists', 'js');
  ctools_add_css('pushtape_playlist.inline', 'pushtape_playlists');

  $done = TRUE;
}

/**
 * Place HTML within the modal.
 *
 * @param $title
 *   The title of the modal.
 * @param $html
 *   The html to place within the modal.
 */
function pushtape_playlists_inline_command_display($title, $html) {
  if (is_array($html)) {
    $html = drupal_render($html);
  }
  $html = '<h2>' . $title . '</h2>' . $html;
  return array(
    'command' => 'pushtape_playlists_inline_display',
    'data' => $html,
  );
}

/**
 * Dismiss the modal.
 */
function pushtape_playlists_inline_command_dismiss() {
  return array(
    'command' => 'pushtape_playlists_inline_dismiss',
  );
}

/**
 * Display loading screen in the modal
 */
function pushtape_playlists_inline_command_loading() {
  return array(
    'command' => 'pushtape_playlists_inline_loading',
  );
}

/**
 * Render an image as a button link. This will automatically apply an AJAX class
 * to the link and add the appropriate javascript to make this happen.
 *
 * @param $image
 *   The path to an image to use that will be sent to theme('image') for rendering.
 * @param $dest
 *   The destination of the link.
 * @param $alt
 *   The alt text of the link.
 * @param $class
 *   Any class to apply to the link. @todo this should be a options array.
 */
function pushtape_playlists_inline_image_button($image, $dest, $alt, $class = '') {
  return ctools_ajax_text_button(theme('image', $image), $dest, $alt, $class, 'pushtape-playlist-inline');
}

/**
 * Render text as a link. This will automatically apply an AJAX class
 * to the link and add the appropriate javascript to make this happen.
 *
 * Note: 'html' => true so be sure any text is vetted! Chances are these kinds of buttons will
 * not use user input so this is a very minor concern.
 *
 * @param $image
 *   The path to an image to use that will be sent to theme('image') for rendering.
 * @param $dest
 *   The destination of the link.
 * @param $alt
 *   The alt text of the link.
 * @param $class
 *   Any class to apply to the link. @todo this should be a options array.
 */
function pushtape_playlists_inline_text_button($text, $dest, $alt, $class = '') {
  return ctools_ajax_text_button($text, $dest, $alt, $class, 'pushtape-playlist-inline');
}

/**
 * Wrap a form so that we can use it properly with AJAX. Essentially if the
 * form wishes to render, it automatically does that, otherwise it returns
 * so we can see submission results.
 *
 * @return
 *   The output of the form, if it was rendered. If $form_state['ajax']
 *   is set, this will use pushtape_playlists_inline_form_render so it will be
 *   a $command object suitable for ctools_ajax_render already.
 *
 *   The return will be NULL if the form was successfully submitted unless
 *   you specifically set re_render = TRUE. If ajax is set the
 *   form will never be redirected.
 */
function pushtape_playlists_inline_form_wrapper($form_id, &$form_state) {
  // This won't override settings already in.
  $form_state += array(
    're_render' => FALSE,
    'no_redirect' => !empty($form_state['ajax']),
  );

  $output = drupal_build_form($form_id, $form_state);
  
  if (!empty($form_state['ajax']) && empty($form_state['executed'])) {
    return pushtape_playlists_inline_form_render($form_state, $output);
  }

  return $output;
}

/**
 * Render a form into an AJAX display.
 */
function pushtape_playlists_inline_form_render($form_state, $output) {
  if (is_array($output)) {
    $output = drupal_render($output);
  }
  $title = empty($form_state['title']) ? drupal_get_title() : $form_state['title'];

  // If there are messages for the form, render them.
  if ($messages = theme('status_messages')) {
    $output = '<div class="messages">' . $messages . '</div>' . $output;
  }

  $commands = array();
  if (isset($form_state['js settings'])) {
    $commands[] = ctools_ajax_command_settings($form_state['js settings']);
  }

  $commands[] = pushtape_playlists_inline_command_display($title, $output);
  return $commands;
}

/**
 * Perform a simple modal render and immediately exit.
 *
 * This is primarily used for error displays, since usually modals will
 * contain forms.
function pushtape_playlists_inline_render($title, $output) {
  $commands = array();
  $commands[] = pushtape_playlists_inline_command_display($form_state['active_elem_index'], $title, $output);
  // ctools_include('ajax');
  // ctools_ajax_render($commands);
  ajax_render($commands);
}

 */
