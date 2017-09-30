document.addEventListener('turbolinks:load', function() {
  var gameAvatars = document.getElementsByClassName('game-avatar');
  for (var i = 0; i < gameAvatars.length; i++) {
    var game = gameAvatars[i];
    if (game.clientWidth >= 500) {
      game.className += " exten-avatar";
    }
  }

  setTimeout(function(){
    $('.flash').slideUp(1000);
  }, 1500);
});
