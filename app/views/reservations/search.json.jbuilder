json.array! @reservations do |reservation|
  json.date reservation.reservation_date
  json.count reservation.count
end