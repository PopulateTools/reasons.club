function openNewIssueInvitePref(val) {
  $('.invites-pref').hide();
  $('#invites_' + val).show();
}

function rebindAll() {
  $('.tipsit').tipsy({fade: true, gravity: 's'});
  $('.tipsit-n').tipsy({fade: true, gravity: 'n'});
}

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

  $(".best_in_place").best_in_place();

  // Load reason refered in URL
  a = window.location.pathname;
  h = window.location.hash;
  h = h.substring(1);
  if((a.indexOf('issues') >= 0) && (window.location.hash != '')) {
    $.ajax({
      url: window.location.pathname + "/reasons/" + h,
      dataType: 'script',
      success: function(data) {}
    });
  }

  /*
   * Reasons interactions
   *
   */
  rebindAll(null);
});

$(document).on('click', '.issue_follow a', function(e) {
  if($(this).attr('href') === ''){
    e.preventDefault();
    $('.issue_follow').find('ul.options').show();
  }
});

$(document).mouseup(function (e) {
  var container = $('ul.options');
  if (!container.is(e.target) && container.has(e.target).length === 0) {
    container.hide();
  }
});

$(document).on('change', 'input[name="issue[privacy_public]"]', function(){
  openNewIssueInvitePref(this.value)
});

$(document).on('ajax:beforeSend', '.btn-vote', function(){
  numVotes = $(this).find('a').text();
  $(this).find('a').html('<i class="fa fa-cog fa-spin"></i>');
});

$(document).on('ajax:beforeSend', '.add_reason_input form', function(){
  $(this).find('.fa').removeClass('fa-plus-circle');
  $(this).find('.fa').addClass('fa-cog fa-spin');
});

$(document).on('ajax:success', '.add_reason_input form', function(){
  $(this).find('.fa').addClass('fa-plus-circle');
  $(this).find('.fa').removeClass('fa-cog fa-spin');
});

// show issue edit link when hovering header
$(document).on('mouseenter', '.issue header .show_edit', function(e) {
  $('.edit_issue').velocity("fadeIn", { duration: 200 });
});

// hide issue edit link when hovering header
$(document).on('mouseleave', '.issue header .show_edit', function(e) {
  $('.edit_issue').velocity("fadeOut", { duration: 200 });
});


