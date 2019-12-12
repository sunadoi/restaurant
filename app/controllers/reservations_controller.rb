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

  def complete
    @reservation = Reservation.find(params[:id])
    @date = @reservation.reservation_date.strftime("%Y年%m月%d日 %H時%M分")
    @menu = Menu.find(@reservation.menu_id)
    @text = "お名前: #{@reservation.user_name}\n予約日時: #{@date}\nコース名: #{@menu.name}\n人数: #{@reservation.count}"
  end
  
end
