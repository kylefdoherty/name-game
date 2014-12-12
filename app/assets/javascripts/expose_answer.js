$(function() {
  $('.question-type').mouseover(function(){
      $(this).children().stop().animate({
          right: 0
      }, "slow");
  }).mouseout(function(){
      $(this).children().stop().animate({
          right: '-800px'
      }, "slow");
  });
});

