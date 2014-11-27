// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require facebookphotoselector.jquery
//= require bootstrap-sprockets

$(function() {
 window.fbAsyncInit = function() {
    FB.init({
      appId      : '1540320802851738',
      xfbml      : true,
      version    : 'v2.1'
    });

    FacebookPhotoSelector.setFacebookSDK(FB);


    $('#facebook_photo_selector').facebookPhotoSelector({
        onFinalSelect : function(photos)
        {
            console.log(photos);
        }
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

});

