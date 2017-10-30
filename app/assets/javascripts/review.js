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
});
