document.addEventListener('turbolinks:load', function() {
  $(document).on('mouseover', '.main-comment', function() {
    $(this).find('.comment-actions').each(function() {
      $(this).show();
    });
  }).on('mouseout', '.main-comment', function() {
    $(this).find('.comment-actions').each(function() {
      $(this).hide();
    });
  });

  $(document).on('mouseover', '.reply-comment', function() {
    $(this).find('.reply-comment-actions').each(function() {
      $(this).show();
    });
  }).on('mouseout', '.reply-comment', function() {
    $(this).find('.reply-comment-actions').each(function() {
      $(this).hide();
    });
  });

  $(document).on('mouseover', '.review-mini', function() {
    $(this).find('.review-actions').each(function() {
      $(this).show();
    });
  }).on('mouseout', '.review-mini', function() {
    $(this).find('.review-actions').each(function() {
      $(this).hide();
    });
  });

  $(document).on('mouseover', '.review', function() {
    $(this).find('.review-actions').each(function() {
      $(this).show();
    });
  }).on('mouseout', '.review', function() {
    $(this).find('.review-actions').each(function() {
      $(this).hide();
    });
  });

  $('.medium-insert-images').next().remove();
  $('.medium-insert-images').remove();
  $('.review-mini').each(function() {
    id = $(this).data('id');
    p = $('.review-content.' + id).find('p');
    size = 1;
    if(p.length > size) {
      for (i = 0; i < size ; i++) {
        p[i].innerText = p[i].innerText.substring(0, 1000) + " [Continue...]";
      };

      for (i = size; i < p.length; i++) {
        p[i].remove();
      };
    } else {
      for (i = 0; i < p.length ; i++) {
        p[i].innerText = p[i].innerText.substring(0, 1000) + " [Continue...]";
      };
    }
  });
});
