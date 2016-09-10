;$(function(e){
  $('textarea.js-auto-size').textareaAutoSize();
});

$(document).on('keydown', '.reason_title', function(event) {
  if (event.keyCode == 13) {
    $(this.form).submit();
    return false;
  }
});
