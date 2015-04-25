;$(function(e){
  $(".popup").click(function(e){
    e.preventDefault();
    window.open($(this).attr("href"), "popupWindow", "width=600,height=600,scrollbars=yes");
  });

  function rebindAll() {
    $('.tipsit').tipsy({fade: true, gravity: 's'});
    $('.tipsit-n').tipsy({fade: true, gravity: 'n'});
  }

  // $.slidebars();
  // $.subscribe("view:ready", rebindAll);
  
  // new issue
  $('input[name="issue[privacy_public]"]').on('change', function(){
    openNewIssueInvitePref(this.value)
  });
  function openNewIssueInvitePref(val) {
    $('.invites-pref').hide();
    $('#invites_' + val).show();
  }

  
  /*
   * Reasons interactions
   *
   */

  /* reason upvote */
  // ToDo control if I'm up or downvoting
  $('.btn-vote').bind('ajax:beforeSend', function(){
    numVotes = $(this).find('a').text();
    $(this).find('a').html('<i class="fa fa-cog fa-spin"></i>');
    // status = $(this).find('a').attr('action');
  })/*
  .bind('ajax:success', function(){

  })
  .bind('ajax:complete', function(){
    console.log('complete');
  }).bind('ajax:error', function(){
    console.log('error');
  })
  */
  ;

  /* reason add */
  $('.add_reason_input form').bind('ajax:beforeSend', function(){
    $(this).find('.fa').removeClass('fa-plus-circle');
    $(this).find('.fa').addClass('fa-cog fa-spin');
  }).bind('ajax:success', function(){
    $(this).find('.fa').addClass('fa-plus-circle');
    $(this).find('.fa').removeClass('fa-cog fa-spin');
  });

  rebindAll(null);

});




// $(document).on('click', 'a[data-remote=true]', function(e) {
//   history.pushState({}, '', $(this).attr('href'));
// });

// $(window).on('popstate', function () {
//   console.log('pop');
//   $.get(document.location.href)
// });

