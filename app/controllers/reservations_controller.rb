class ReservationsController < ApplicationController
  def index
    @reservation = Reservation.new(reservation_params)
  end
  
  def new
    @reservation = Reservation.new(reservation_params)

    before_date = @reservation.reservation_date - 1.hours - 30.minutes
    after_date = @reservation.reservation_date + 1.hours + 30.minutes
    reservations = Reservation.where(["reservation_date >= :before_date and reservation_date <= :after_date", {before_date: before_date, after_date: after_date}])

    counts = 0
    reservations.each do |reservation|
      counts += reservation.count 
    end

    if (@reservation.count + counts) > 16
      flash.now[:alert] = '予約状況によりご希望の時間帯、人数での予約ができません'
      render :index
    end

    @menu = Menu.find(params[:menu_id])
    price = @menu.price
    @amount = price * @reservation.count
  end

  # 席のみの予約の時にcreateアクションになるように。コース予約はpayments_controllerのcreateアクション
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save

    redirect_to complete_reservation_path(id: @reservation.id)

  end

  def search
    return nil if params[:count] == ""
    date = params[:date].to_datetime
    # dataは9時間進んだ情報が格納されている(UTC)ので目的とする時間-1.5時間と目的とする時間+1.5時間を設定
    before_date = date - 10.hours - 30.minutes
    after_date = date - 7.hours - 30.minutes

    @reservations = Reservation.where(["reservation_date >= :before_date and reservation_date <= :after_date", {before_date: before_date, after_date: after_date}])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def complete
    @reservation = Reservation.find(params[:id])
    @date = @reservation.reservation_date.strftime("%Y年%m月%d日 %H時%M分")
    @menu = Menu.find(@reservation.menu_id)
    @text = "お名前: #{@reservation.user_name}\n予約日時: #{@date}\nコース名: #{@menu.name}\n人数: #{@reservation.count}"
  end

  private

  def reservation_params
    params.permit(:user_name, :reservation_date, :menu_id, :count, :amount, :request)
  end
  
end
