class ReservationsController < ApplicationController
  def index
  end
  
  def new
    @reservation = Reservation.new(
      user_name: params[:user_name],
      reservation_date: params[:reservation_date],
      menu_id: params[:menu_id],
      count: params[:count],
      amount: params[:amount],
      request: params[:request]
    )

    @menu = Menu.find(params[:menu_id])
    price = @menu.price
    @amount = price * @reservation.count

  end
  
end
