;$(function(e){
  $(".popup").click(function(e){
    e.preventDefault();
    var width = 600;
    var height = 500;
    var left = parseInt((screen.availWidth/2) - (width/2));
    var top = parseInt((screen.availHeight/2) - (height/2));
    var windowFeatures = "width=" + width + ",height=" + height + ",status,resizable,left=" + left + ",top=" + top + "screenX=" + left + ",screenY=" + top;
    window.open($(this).attr("href"), "popup", windowFeatures);
  });

  function rebindAll() {
    $('.tipsit').tipsy({fade: true, gravity: 's'});
    $('.tipsit-n').tipsy({fade: true, gravity: 'n'});
  }

  // $.slidebars();
  // $.subscribe("view:ready", rebindAll);
  
  $(".best_in_place").best_in_place();

  // new issue
  $('input[name="issue[privacy_public]"]').on('change', function(){
    openNewIssueInvitePref(this.value)
  });
  function openNewIssueInvitePref(val) {
    $('.invites-pref').hide();
    $('#invites_' + val).show();
  }

  a = window.location.pathname;
  h = window.location.hash;
  h = h.substring(1);
  if((a.indexOf('issues') >= 0) && (window.location.hash != '')) {
    console.log('entrando');
    $.ajax({
      url: "/reason/" + h,
      dataType: 'script',
      success: function(data) {
        console.log('ajax');    
      }
    });    
  }
  // });

  
  /*
   * Reasons interactions
   *
   */

  /* reason upvote */
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

  $('.issue_follow a').click(function(e) {
    e.preventDefault();
    $('.issue_follow').find('ul.options').show();
  });
  $(document).mouseup(function (e) {
    var container = $('ul.options');
    if (!container.is(e.target) && container.has(e.target).length === 0) {
      container.hide();
    }
  });


  rebindAll(null);

});