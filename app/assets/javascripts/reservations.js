$(function () {
  // datetimepickerの実装
  $.datetimepicker.setLocale('ja');
  $("#DateTime").datetimepicker({
    allowTimes:[
      '17:30', '18:00', '18:30', '19:00', '19:30', 
      '20:00', '20:30', '21:00', '21:30'
    ],
    minDate:'-1970/01/01',
    maxDate:'+1970/01/15',
    defaultTime: '17:30'
  });

  // インクリメンタルサーチによる予約状況に基づいた予約の可否
  function searchReservation(){
    let input = $("#people_number").val();
    let date = $("#DateTime").val();
    $.ajax({
      type: "GET",
      url: "/reservations/search",
      dataType: "json",
      data: { count: input, date: date }
    })
    .done(function(reservations){
      $(".over-people").empty();
      if (reservations.length !== 0) {
        let counts = 0;
        reservations.forEach(function(reservation) {
          counts += reservation.count;
        });
        if (parseInt(counts)+parseInt(input) > 16) {
          let html = `<p>予約状況によりご希望の時間帯、人数での予約ができません</p>`
          $(".over-people").append(html);
        }
      }
    })
    .fail(function(){
      alert("通信に失敗しました");
    })
  };

  $("#people_number").on("keyup", function(){
    searchReservation();
  });

  $("#DateTime").change(function(){
    searchReservation();
  });
});
  