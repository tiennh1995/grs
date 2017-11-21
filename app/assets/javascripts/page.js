document.addEventListener('turbolinks:load', function() {
  var gameCovers = document.getElementsByClassName('game-cover');
  for (var i = 0; i < gameCovers.length; i++) {
    var game = gameCovers[i];
    if (game.clientWidth >= 500) {
      game.className += 'exten-cover';
    }
  }

  setTimeout(function(){
    $('.flash').slideUp(1000);
  }, 1500);

  $(document).on('click', '.top-5', function() {
    $(this).addClass('active');
    $('.recent').removeClass('active');
    $('.top-5-list').show();
    $('.recent-list').hide();
  }).on('click', '.recent', function() {
    $(this).addClass('active');
    $('.top-5').removeClass('active');
    $('.top-5-list').hide();
    $('.recent-list').show();
  });

  //onclick to-top
  $(document).on('click', '.fa-chevron-up', function() {
    $('html,body').animate({
      scrollTop: $('.body').scrollTop()
    }, 1000);
  });

  //#to-top button appears after scrolling
  $(document).scroll(function() {
    if ($(this).scrollTop() > 250) {
      $('#to-top').show('slow', function() {
        $('#to-top').css({position: 'fixed', display: 'block'});
      });
    } else {
      $('#to-top').hide('slow', function() {
        $('#to-top').css({display: 'none'});
      });
    }
  });
});
