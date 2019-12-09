$(function () {
  $('.tab-content').hide();
  $('.tab-content').eq(0).show();

  $('.tab-button').each(function () {
    $(this).on('click', function () {
      var index = $('.tab-button').index(this);
      $('.tab-content').hide();
      $('.tab-content').eq(index).show();
    });
  });
});