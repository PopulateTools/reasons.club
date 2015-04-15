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
  rebindAll(null);

});

// $(document).on('click', 'a[data-remote=true]', function(e) {
//   history.pushState({}, '', $(this).attr('href'));
// });

// $(window).on('popstate', function () {
//   console.log('pop');
//   $.get(document.location.href)
// });

