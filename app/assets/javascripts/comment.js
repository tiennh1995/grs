document.addEventListener('turbolinks:load', function() {
  $(document).on('click', '.btn-hide', function() {
    id = $(this).data('id');
    $('.reply-comments-' + id).empty();
    $('.read-more.' + id).show();
    $('.hide-comment.' + id).hide();
  })
});
