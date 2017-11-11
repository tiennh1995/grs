$(document).on('turbolinks:load', function() {
  setTimeout(function(){
    $('.flash').slideUp(1000);
  }, 1500);

  $(document).on('click', '.treeview a', function() {
    $('.treeview').removeClass('active');
    $(this).parents().eq(2).each(function() {
      $(this).addClass('active');
    });
    $(this).parent().addClass('active');
  });

  $(document).on('click', '.treeview-menu a', function() {
    $('.treeview-menu').children().removeClass('active');
    $(this).parent().addClass('active');
  });
});
