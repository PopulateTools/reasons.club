(function($) {

  /*
  *
  * Set the autofocus attribute to the field and done.
  *
  *   <input type="password" placeholder="Can haz focus." autofocus>
  *
  */

  $.fn.autofocus = function() {
    //Test to see if autofocus is natively supported before proceeding
    return (this.first().autofocus!==true) ? this.focus() : this;
  };

  $("[autofocus]").autofocus();

})(jQuery);