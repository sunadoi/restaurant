$(function () {
  $.datetimepicker.setLocale('ja');
  $("#DateTime").datetimepicker({
    allowTimes:[
      '17:30', '18:00', '18:30', '19:00', '19:30', 
      '20:00', '20:30', '21:00', '21:30'
    ],
    minDate:'-1970/01/01',
    maxDate:'+1970/01/15',
  });
});