$(document).on("turbolinks:load", function() {
  $(".fancybox-button").fancybox({
    prevEffect		: 'none',
    nextEffect		: 'none',
    closeBtn		: false,
    parent : "body",
    helpers		: {
      title	: { type : 'inside' },
      buttons	: {}
    }
  });
});
