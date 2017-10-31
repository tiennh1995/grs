document.addEventListener('turbolinks:load', function() {
  var sum = $('.game-sum-review span').prop('textContent');
  if(sum == 0) {
    rateFive = rateFour = rateThree = rateTwo = rateOne = 0;
  } else {
    rateFive = $('.bar-5 span').prop('textContent') / sum * 80;
    rateFour = $('.bar-4 span').prop('textContent') / sum * 80;
    rateThree = $('.bar-3 span').prop('textContent') / sum * 80;
    rateTwo = $('.bar-2 span').prop('textContent') / sum * 80;
    rateOne = $('.bar-1 span').prop('textContent') / sum * 80;
  }
  $('.bar-5').css('width', rateFive + '%');
  $('.bar-4').css('width', rateFour + '%');
  $('.bar-3').css('width', rateThree + '%');
  $('.bar-2').css('width', rateTwo + '%');
  $('.bar-1').css('width', rateOne + '%');
});
