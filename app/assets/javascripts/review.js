document.addEventListener('turbolinks:load', function() {
  $('.reply-comment-icon').on('click', function() {
    var id = $(this).data('id');
    $('.reply-' + id).toggle();
  })

  $('.comment').on('mouseover', function() {
    $(this).find(".comment-actions").each(function() {
      $(this).show();
    });
  }).on('mouseout', function() {
    $(this).find(".comment-actions").each(function() {
      $(this).hide();
    });
  });
});
