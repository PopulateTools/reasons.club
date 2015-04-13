jQuery(document).ready(function($){
  var $form_modal = $('#modal-signin'),
      $form_login = $form_modal.find('#cd-login'),
      $form_signup = $form_modal.find('#cd-signup'),
      $form_forgot_password = $form_modal.find('#cd-reset-password'),
      $forgot_password_link = $form_login.find('.cd-form-bottom-message a'),
      $main_nav = $('.nav_personal');

  $('.cd-signup').on('click', function(event){
    event.preventDefault();
    open_modal('#modal-signin', 'signup');
    $('#invite_email').focus();
  });

  $('.cd-signin').on('click', function(event){
    event.preventDefault();
    open_modal('#modal-signin', 'login');
  });

  if($('#modal-signin').data('error') !== undefined){
    $('#modal-signin').data('error');
    open_modal('#modal-signin');
  }

  if($('#modal-track').data('error') !== undefined){
    $('#modal-track').data('error');
    open_modal('#modal-track');
  }

  if(window.location.hash == "#login"){
    open_modal('login');
  }

  if(window.location.hash == "#signup"){
    open_modal('signup');
  }
  if(window.location.hash == "#modal-track"){
    open_modal('#modal-track');
  }
  
  //close modal
  $('.cd-user-modal').on('click', function(event){
    if( $(event.target).is('.cd-user-modal') || $(event.target).is('.cd-close-form') ) {
      $('.cd-user-modal').removeClass('is-visible');
    } 
  });

  // Prevent Enter key to click on the first button of the form, which is the link to the
  // other form
  // $(document).keydown(function(event){
  //   if(event.which=='13'){
  //     event.preventDefault();
  //     $('form:visible').submit();
  //   }
  // });

  //close modal when clicking the esc keyboard button
  $(document).keyup(function(event){
    event.preventDefault();
    if(event.which=='27'){
      $('.cd-user-modal').removeClass('is-visible');
    }
  });

  //show forgot-password form 
  $forgot_password_link.on('click', function(event){
    event.preventDefault();
    forgot_password_selected();
  });

  $('.create-account').on('click', function(event){
    event.preventDefault();
    $('#user_email').val($('#session_email').val());
    $('#user_password').val($('#session_password').val());
    signup_selected();
    $('#user_name').focus();
  });

  $('.login').on('click', function(event){
    event.preventDefault();
    login_selected();
  });

  $('#session_password').on('focus', function(event){
    event.preventDefault();
    $('.recover-password').css('visibility', 'visible');  
  });

  $('#session_password').on('blur', function(event){
    $('.recover-password').delay(500).queue(function() {
      $('.recover-password').css('visibility', 'hidden'); 
    });
  });

  $('.recover-password').on('click', function(event){
    event.preventDefault();
    forgot_password_selected();
    $('#email').val($('#session_email').val());
    $('#email').focus();
    
  });


  function open_modal(modal, target){
    modal = typeof modal !== 'undefined' ?  modal : '#modal-signin';
    target = typeof target !== 'undefined' ?  target : 'login';

    $(modal).addClass('is-visible');

    if(($('#modal-signin').data('error') || target) == 'login') {
      login_selected();
    }
    if(($('#modal-signin').data('error') || target) == 'signup') {
      signup_selected();
    }
  }

  function login_selected(){
    $form_login.addClass('is-selected');
    $form_signup.removeClass('is-selected');
    $form_forgot_password.removeClass('is-selected');
  }
  function signup_selected(){
    $form_login.removeClass('is-selected');
    $form_signup.addClass('is-selected');
    $form_forgot_password.removeClass('is-selected'); 
  }
  function forgot_password_selected(){
    $form_login.removeClass('is-selected');
    $form_signup.removeClass('is-selected');
    $form_forgot_password.addClass('is-selected');
  }

  //IE9 placeholder fallback
  //credits http://www.hagenburger.net/BLOG/HTML5-Input-Placeholder-Fix-With-jQuery.html
  if(!Modernizr.input.placeholder){
    $('[placeholder]').focus(function() {
      var input = $(this);
      if (input.val() == input.attr('placeholder')) {
        input.val('');
      }
    }).blur(function() {
      var input = $(this);
      if (input.val() == '' || input.val() == input.attr('placeholder')) {
        input.val(input.attr('placeholder'));
      }
    }).blur();
    $('[placeholder]').parents('form').submit(function() {
      $(this).find('[placeholder]').each(function() {
        var input = $(this);
        if (input.val() == input.attr('placeholder')) {
          input.val('');
        }
      })
    });
  }


  /* Donation tracking form modal 
   * This should go to another file?
   */
  $('.modal-track-open').on('click', function(event){
    event.preventDefault();
    open_modal('#modal-track');
  });




});

//credits http://css-tricks.com/snippets/jquery/move-cursor-to-end-of-textarea-or-input/
jQuery.fn.putCursorAtEnd = function() {
  return this.each(function() {
    // If this function exists...
    if (this.setSelectionRange) {
      // ... then use it (Doesn't work in IE)
      // Double the length because Opera is inconsistent about whether a carriage return is one character or two. Sigh.
      var len = $(this).val().length * 2;
      this.setSelectionRange(len, len);
    } else {
      // ... otherwise replace the contents with itself
      // (Doesn't work in Google Chrome)
      $(this).val($(this).val());
    }
  });
};
