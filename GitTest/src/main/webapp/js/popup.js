
// 헤더 스크롤시
$(document).ready(function() {
   $(window).scroll(function() {
      var scroll = $(window).scrollTop();
      if (scroll > 1) {
         $("header").css("borderBottom", "1px solid #282828");
         $("header").css("background", "#020202");
      } else {
         $("header").css("borderBottom", "none");
         $("header").css("background", "none");
      }
   })
})


$(function() {

   $("#inputCol").focus(function() {
      $(this).css("color", "#fff");
   });
   $("#inputCol").blur(function() {
      $(this).css("color", "#666");
   });

});





