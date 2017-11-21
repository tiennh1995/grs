document.addEventListener('turbolinks:load', function() {
  var sum = $('.admin-game-sum-review span').prop('textContent');
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

  var slideIndex = 1;
  showDivs(slideIndex);

  function plusDivs(n) {
    showDivs(slideIndex += n);
  }

  function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("mySlides");
    if(x.length) {
      if (n > x.length) {slideIndex = 1}
      if (n < 1) {slideIndex = x.length}
      for (i = 0; i < x.length; i++) {
         x[i].style.display = "none";
      }
      x[slideIndex-1].style.display = "block";
    }
  }

  $(document).on('click', '.w3-display-left', function() {
    plusDivs(-1);
  });

  $(document).on('click', '.w3-display-right', function() {
    plusDivs(1);
  });

  $('.game-cover-field').change(function(){
    readURL(this, $('.game-cover'));
  });

  $(document).on('change', '.screenshot-image-field', function() {
    readURL(this, $(this).prev());
  });

  function readURL(input, image) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        image.attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $(document).on('click', '.remove_fields', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).parent().parent().hide();
    event.preventDefault();
  });

  $('.add_fields').on('click', function(event) {
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    event.preventDefault();
  })
});
