jQuery(document).ready(function($){
  $('textarea.js-auto-size').textareaAutoSize();

  $('.reason_title').keydown(function(event) {
    if (event.keyCode == 13) {
      $(this.form).submit()
      return false;
    }
  })

});