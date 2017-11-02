document.addEventListener('turbolinks:load', function() {
  $(document).on('submit', '.form-search', function(e) {
    if($('.search-field').val() == '') {
      e.preventDefault();
    }
  });

  $(document).on('click', '.search-icon', function(e) {
    $('.form-search').submit();
  });
});
