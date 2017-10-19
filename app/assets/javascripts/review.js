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
});
