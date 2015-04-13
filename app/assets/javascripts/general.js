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

