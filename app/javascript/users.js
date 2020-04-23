// user list スライド
var $carousel = $('.card-user');

$(document).on('turbolinks:load',function() {
  $('.user-slider').slick({
    autoplay: false,
    arrows: true,
    slidesToShow: 5,
    slidesToScroll:	5,
    swipe: true,
    verticalSwiping: true,
    prevArrow: '<div class="prev">PREV</div>',
    nextArrow: '<div class="next">NEXT</div>',
  });
});

// $('.card-user').on('mouseover', function() {
//   $('.slider').slick('goTo', $(this).index());
// });


$(document).ready(function(){
  $('.user-slider').on('mouseover', function(event, slick, direction){
    $('.result').text('swipe : ' + direction + '方向にスワイプしました。');
  });
  $('.user-slider').slick();
});

// スクロールイベントの監視
// $carousel.on('mouseover', function(e) {
//   e.preventDefault();

//   if (!$carousel.hasClass('js-slick-moving')) {
//     if (e.originalEvent.deltaY < 0) {
//       $(this).slick('slickNext');
//     } else {
//       $(this).slick('slickPrev');
//     }
//   }
// })

// // スライド送り中を判定するためにクラスを付与する
// $carousel.on('beforeChange', function(){
//   $carousel.addClass('js-slick-moving');
// });

// $carousel.on('afterChange', function(){
//   $carousel.removeClass('js-slick-moving');
// });

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
