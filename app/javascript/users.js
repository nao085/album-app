$(document).on('turbolinks:load',function() {
  $('.slider').slick({
    autoplay:true,
    autoplaySpeed:3000,
    arrows: false,
    centerMode: true,
    variableWidth:true,
    pauseOnFocus: false,
    pauseOnHover: false,
    pauseOnDotsHover: false
  });
});

//edit_avatar
$(document).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#avatar_img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#post_img").change(function(){
    $('#avatar_img_prev').removeClass('hidden');
    $('.avatar_present_img').remove();
    readURL(this);
  });
});
