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
//= require bootstrap-slider.min.js

$(function() {
  // Resize the page
  var resize = function (argument) {
    $("#banner").height($(this).height());
  }
  if($('#banner')){
    $(window).on('resize',function(){
      resize();
    })
  }
  resize();

  // responsibité photo vote
  $(window).load(function(){
    if ($(window).width() <= 480){
      if($('#pic1')){
        $('#pic1').removeClass( "stack twisted" )
      }
      if($('#pic2')){
        $('#pic2').removeClass( "stack twisted" )
      }
    }
  });

   $(window).resize(function(){
    if ($(window).width() <= 480){
      if($('#pic1')){
        $('#pic1').removeClass( "stack twisted" )
      }
    }
    else {
      if($('#pic1')){
        $('#pic1').addClass( "stack twisted" )
      }
    }
  });

  $(window).resize(function(){
    if ($(window).width() <= 480){
      if($('#pic2')){
        $('#pic2').removeClass( "stack twisted" )
      }
    }
    else {
      if($('#pic2')){
        $('#pic2').addClass( "stack twisted" )
      }
    }
  });

  // effet photo
  $('#pic1').click(function () {
    $(this).addClass('magictime openDownLeft');
  });
  $('#pic2').click(function () {
    $(this).addClass('magictime openDownRight');
  });


  // Slider
  if($("#slide")){
    $("#slide").slider({
      value : [ parseInt($('.min-age').val() || 18),parseInt($('.max-age').val() || 77) ]
    });
    $("#slide").on('change',function (e) {
      var value = $(this).val().split(',');
      $('.min-age').val(value[0]);
      $('.max-age').val(value[1]);
    });
  }

  // Pie chart
  var $ppc = $('.progress-pie-chart'),
    percent = parseInt($ppc.data('percent')),
    deg = 360*percent/100;
  if (percent > 50) {
    $ppc.addClass('gt-50');
  }
  $('.ppc-progress-fill').css('transform','rotate('+ deg +'deg)');
  $('.ppc-percents span').html(percent+'%');

  // FB upload
 window.fbAsyncInit = function() {
    FB.init({
      appId      : '1397748350517057',
      xfbml      : true,
      version    : 'v2.1'
    });

    FacebookPhotoSelector.setFacebookSDK(FB);

    var myPhotos = [];
    $('#facebook_photo_selector').facebookPhotoSelector({
        onFinalSelect : function(photos)
        {
          console.log(photos);

          var photo_facebook_id = photos[0];

          FB.api(photo_facebook_id, function(response) {
            var photo_url = response.source;

            $.post("/pictures", { picture: { file: photo_url } }, function(data) {
              console.log(data.id);

              myPhotos.push(data);

              if (myPhotos.length === 1) {
                $('<div class="col-md-offset-3 col-md-3"><a href="#" class="picture-wrapper thumbnail" data-facebook-id="' + photos + '"><img src="' + data.file + '" alt="' + photos + '""></a></div>').appendTo("#select_button");
                $("#select_button").append('<div><a class=" btn btn-lg btn-primary " id="second" data-toggle="modal" href="#facebook_photo_selector">Select Your 2nd Photo</a></div>');
                $("#first").hide()
                $("#campaign_picture_a_id").val(data.id);
              } else {
                $('<div class="col-md-3"><a href="#" class="picture-wrapper thumbnail" data-facebook-id="' + photos + '"><img src="' + data.file + '" alt="' + photos + '""></a></div>').appendTo("#select_button");
                $("#second").hide();
                $("#campaign_picture_b_id").val(data.id);
                $("#start_voting_button").show();
              }
            });
          });
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



