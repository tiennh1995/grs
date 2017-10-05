document.addEventListener('turbolinks:load', function() {
  var gameCovers = document.getElementsByClassName('game-cover');
  for (var i = 0; i < gameCovers.length; i++) {
    var game = gameCovers[i];
    if (game.clientWidth >= 500) {
      game.className += " exten-cover";
    }
  }

  setTimeout(function(){
    $('.flash').slideUp(1000);
  }, 1500);

  $('.top-5').on('click', function() {
    $(this).addClass("active");
    $('.recent').removeClass("active");
    $('.top-5-list').show();
    $('.recent-list').hide();
  });

  $('.recent').on('click', function() {
    $(this).addClass(" active");
    $('.top-5').removeClass("active");
    $('.top-5-list').hide();
    $('.recent-list').show();
  });
});
