$(document).on("turbolinks:load", function() {  
  forms = $('#message-upload, #file-upload');
  forms.submit(function(){
    $('.progress').show();
  });
  forms.ajaxForm();
});
