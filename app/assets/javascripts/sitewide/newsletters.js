$(document).on("turbolinks:load", function() {

  var newslettersTable = $("#newsletters-table"),
      viewButton = newslettersTable.find(".view");

  // line clickable
  newslettersTable.on("click", "tbody tr", function(e) {
    var id = $(this).data('url') ;
    if ( typeof id !== 'undefined' ) {
      viewButton.addClass("on");
      viewButton.attr('href', "/newsletters/" + id);
    }
  });

  // Double click
  newslettersTable.on("dblclick", "tbody tr", function() {
    var id = $(this).data('url');
    if ( typeof id !== 'undefined' ) {
      window.location = "/newsletters/" + id;
    }
  });
});
