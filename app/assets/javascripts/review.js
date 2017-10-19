document.addEventListener('turbolinks:load', function() {
  $(document).on('mouseover', '.comment', function() {
    $(this).find(".comment-actions").each(function() {
      $(this).show();
    });
  }).on('mouseout', '.comment', function() {
    $(this).find(".comment-actions").each(function() {
      $(this).hide();
    });
  });
});
