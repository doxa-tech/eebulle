$(document).on("turbolinks:load", function() {
  var fancyButton = $(".fancybox-button");
  if(fancyButton.length) {
    fancyButton.fancybox({
      prevEffect		: 'none',
      nextEffect		: 'none',
      closeBtn		: false,
      parent : "body",
      helpers		: {
        title	: { type : 'inside' },
        buttons	: {}
      }
    });
  }
});
