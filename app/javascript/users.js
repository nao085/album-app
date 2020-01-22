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