class ReservationsController < ApplicationController
  def index
  end
  
  def new
    @reservation = Reservation.new(
      # reservarion_date: 2019-12-24 19:00:00,
      user_id: 1,
      menu_id: params[:menu_id],
      count: params[:count]
    )

    @user = User.find(1)

    @menu = Menu.find(params[:menu_id])
    price = @menu.price
    @amount = price * @reservation.count

  end
  
end
