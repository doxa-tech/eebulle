$(document).on("ready page:load", function() {  
  forms = $('#message-upload, #file-upload');
  forms.submit(function(){
    $('.progress').show();
  });
  forms.ajaxForm(); 
}); 