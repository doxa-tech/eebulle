$(document).on("ready page:load", function() {
  $(".fancybox").fancybox({
    prevEffect    : 'none',
    nextEffect    : 'none',
    closeBtn    : false,
    helpers   : {
      title : { type : 'inside' },
      buttons : {}
    },
    parent: "body"
  });
});