$(function () {
  $('.tab-content').hide();
  $('.tab-content').eq(0).show();
  $('.tab-button').eq(0).addClass('active');

  $('.tab-button').each(function () {
    $(this).on('click', function () {
      var index = $('.tab-button').index(this);
      $('.active').removeClass('active');
      $(this).addClass('active');
      $('.tab-content').hide();
      $('.tab-content').eq(index).show();
    });
  });
});
