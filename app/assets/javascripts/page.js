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
});
