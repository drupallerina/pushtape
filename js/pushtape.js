// $Id$
(function ($) {

Drupal.behaviors.pushtape = {
  attach: function (context, settings) {
    //START
    
    //Album Artwork toggle
    if ($('.node-track-form input#edit-field-album-artwork-checkbox').is(':checked') == false) {
      $('.node-track-form #edit-field-artwork').hide();  
    }
    $('input#edit-field-album-artwork-checkbox').change(function(){ 
         var checked = $(this).is(':checked');
         if (checked == true) {
           $('#edit-field-artwork').show();  
         }
         else {
           $('#edit-field-artwork').hide();
         }
    });    
    
    // Show/Hide Album Creation fields
    if ($('input#edit-field-album-checkbox').is(':checked') == false) {
      $('.album-wrap').hide();  
    }
    $('input#edit-field-album-checkbox').change(function(){ 
         var checked = $(this).is(':checked');
         if (checked == true) {
           $('.album-wrap').show();  
         }
         else {
           $('.album-wrap').hide();
         }
    });

    // Show the new album field if selected in dropdown, hide otherwise.
    var album = $('select#edit-field-album-und').val();
    if (album == '_none') {
      $('.new-album').show();  
    }
    else {
      $('.new-album').hide();
    }
    $('select#edit-field-album-und').change(function() {
      if ($(this).val() == '_none') {
        $('.new-album').show();  
      }
      else {
        $('.new-album').hide();  
      }
    });
    
    //END
  }
};

}(jQuery));
