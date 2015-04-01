;$(function(e){
  $(".popup").click(function(e){
    e.preventDefault();
    window.open($(this).attr("href"), "popupWindow", "width=600,height=600,scrollbars=yes");
  });

  // $('#donation_project_attributes_name').on("select2-selecting", function(e){
  //   if (e.choice.text.indexOf(I18n.t('add_project')) > 0) {
  //     $('#project_attributes').slideDown();
  //   } else {
  //     $('#project_attributes').slideUp();
  //   }
  // });

  function rebindAll() {
    $('.tipsit').tipsy({fade: true, gravity: 's'});
    $('.tipsit-n').tipsy({fade: true, gravity: 'n'});
  }

  // $.slidebars();
  // $.subscribe("view:ready", rebindAll);
  rebindAll(null);
});

