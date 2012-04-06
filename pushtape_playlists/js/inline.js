/**
 * @file
 * 
 * CTools AJAX Responder for inline form.
 */
(function ($) {
  Drupal.pushtape_playlists = Drupal.pushtape_playlists || {};
  Drupal.pushtape_playlists.inline = {};
  Drupal.pushtape_playlists.inline.active_elements = [];

  Drupal.pushtape_playlists.inline.submitAjaxForm = function(e) {
    var url = $(this).attr('action');
    var form = $(this);
    
    setTimeout(function() { Drupal.CTools.AJAX.ajaxSubmit(form, url); }, 1);
    return false;
  };
  
  /**
   * AJAX command to dismiss BeautyTip.
   */
  Drupal.pushtape_playlists.inline.pushtape_playlists_inline_dismiss = function(ajax, response, status) {
    $('.pushtape-playlists-inline-active').removeClass('pushtape-playlists-inline-active').btOff();
  };

  /**
   * AJAX command to place HTML within a BeautyTip.
   */
  Drupal.pushtape_playlists.inline.pushtape_playlists_inline_display = function(ajax, response, status) {
    $('.pushtape-playlists-inline-active').removeClass('pushtape-playlists-inline-active').btOff();
    var settings = {};
    settings = Drupal.settings.pushtape_playlists_inline;
    settings.trigger = 'none';
    $active_element = $(ajax.element);
    $active_element.bt(response.data, Drupal.settings.pushtape_playlists_inline).btOn().addClass('pushtape-playlists-inline-active');
    Drupal.attachBehaviors();    
  }
  
  /**
   * AJAX command to copy one element and append it to another.
   */
  Drupal.pushtape_playlists.inline.pushtape_playlists_copy_to = function(ajax, response, status) {
    $element = $(response.selector).clone();
    $element.addClass(response.add_classes);
    $element.removeClass(response.remove_classes);
    $element.find(response.link_selector).attr('href', response.link_href).removeClass('pushtape-playlists-inline-processed');
    $element.find(response.remove_link_selector).attr('href', response.remove_link_href).removeClass('pushtape-playlists-inline-processed');
    $(response.destination).append($element);
    Drupal.attachBehaviors();
    $('.sm2-360ui').remove();
    $('a.sm2_link').each(function() {
      $(this).attr('href', $(this).attr('href') + Math.random());
    })
    threeSixtyPlayer.init(soundManager);
  }


  /**
   * AJAX command to add an empty Playlist to the view.
   */
  Drupal.pushtape_playlists.inline.pushtape_playlists_add_new_playlist = function(ajax, response, status) {
    var $empty_table = $(response.view_html).find('.playlist-wrap');
    $('.pushtape-playlists-playlists-view .view-content').prepend($empty_table);
    Drupal.attachBehaviors($empty_table);
    $('.sm2-360ui').remove();
    $('a.sm2_link').each(function() {
      $(this).attr('href', $(this).attr('href') + Math.random());
    })
    threeSixtyPlayer.init(soundManager);
  }
  
  // Define our custom AJAX commands.
  $(function() {
    Drupal.ajax.prototype.commands.pushtape_playlists_inline_display   = Drupal.pushtape_playlists.inline.pushtape_playlists_inline_display;
    Drupal.ajax.prototype.commands.pushtape_playlists_inline_dismiss   = Drupal.pushtape_playlists.inline.pushtape_playlists_inline_dismiss;
    Drupal.ajax.prototype.commands.pushtape_playlists_copy_to          = Drupal.pushtape_playlists.inline.pushtape_playlists_copy_to;
    Drupal.ajax.prototype.commands.pushtape_playlists_add_new_playlist = Drupal.pushtape_playlists.inline.pushtape_playlists_add_new_playlist;
  });
 
  /**
   * Define our Drupal behaviors.
   */
  Drupal.behaviors.pushtape_playlists_inline = {
    attach: function(context) {
      $('a.pushtape-playlists-inline:not(.pushtape-playlists-inline-processed)', context)
        .addClass('pushtape-playlists-inline-processed')
        // .click(Drupal.pushtape_playlists.inline.pushtape_playlists_inline_display)
        .each(function () {
          // Create a drupal ajax object
          var element_settings = {};
          if ($(this).attr('href')) {
            element_settings.url = $(this).attr('href');
            element_settings.event = 'click';
            element_settings.progress = { type: 'throbber' };
          }
          var base = $(this).attr('href');
          Drupal.ajax[base] = new Drupal.ajax(base, this, element_settings);

          // Attach the display behavior to the ajax object
        }
      );

      // Bind our custom event to the form submit
      $('.bt-content form:not(.pushtape-playlists-inline-processed)', context)
        .addClass('pushtape-playlists-inline-processed')
        .each(function() {
          var element_settings = {};
          element_settings.url = $(this).attr('action');
          element_settings.event = 'submit';
          element_settings.progress = { 'type': 'throbber' }
          var base = $(this).attr('id');

          Drupal.ajax[base] = new Drupal.ajax(base, this, element_settings);
          Drupal.ajax[base].form = $(this);

          $('input[type=submit], button', this).click(function() {
            Drupal.ajax[base].element = this;
            this.form.clk = this;
          });
        });
        
        /*
        $('.pushtape-playlists-playlists-view table:not(.pushtape-playlists-inline-processed)', context)
          .addClass('pushtape-playlists-inline-processed')
          .each(function() {
            

            // Hide rows in tables with no tracks.
            $table.filter('.pushtape-playlists-row-track-').find('tbody tr').hide();
          });
        */  

    }
  };
  

  
})(jQuery);

