$(document).on('turbolinks:load', function() {
  setTimeout(function(){
    $('.flash').slideUp(1000);
  }, 1500);

  $(document).on('click', '.treeview a', function() {
    $('.treeview').removeClass('active');
    $(this).parent().addClass('active');
  });
});
