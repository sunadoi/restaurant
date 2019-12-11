class PaymentsController < ApplicationController
  def create

    begin

      #Stripeからの情報を取得
      customer = Stripe::Customer.create(
              email: params[:stripeEmail],
              source: params[:stripeToken]
            )
      
      charge = Stripe::Charge.create(
        customer:       customer.id,
        amount:         params[:amount],
        description:    "#{params[:menu_name]}x#{params[:count]}名分の決済",
        currency:       'jpy',
        receipt_email:  params[:stripeEmail],
      )
      
      #決済記録を作成
      # stripeのcheckoutフォームから送られてきたパラメーターでpaymentのインスタンスを作成
      payment = Payment.new

      payment.email = customer.email # 支払った人がstripeのcheckoutフォームに入力したemail(支払い完了後、stripeからこのメールアドレスに支払い完了メールが送られる)
      payment.description = charge.description #決済の概要
      payment.currency = charge.currency  #通貨
      payment.customer_id = customer.id   # stripeのcustomerインスタンスのID
      payment.payment_date = Time.current # payment_date(支払いを行った時間)は現在時間を入れる
      payment.uuid = SecureRandom.uuid  # 請求書の番号としてuuidを用意する
      payment.charge_id = charge.id  # 返金(refund)の時に使うchargeのIDをpaymentに保存しておく
      payment.stripe_commission = (charge.amount * 0.036).round  # stripeの手数料(3.6%)分の金額
      payment.amount_after_subtract_commission = charge.amount - payment.stripe_commission  # stripeの手数料(3.6%)分を引いた金額(依頼者が払った96.4%の金額)
      payment.receipt_url = charge.receipt_url  # この決済に対するstripeが用意してくれる領収書のURL
      payment.save!

      #フォームから送られてきたパラメータをもとに予約情報を作成
      reservation = Reservation.new

      reservation.user_name = params[:user_name]
      reservation.reservation_date = params[:reservation_date]
      reservation.menu_id = params[:menu_id]
      reservation.count = params[:count]
      reservation.amount = params[:amount]
      reservation.request = params[:request]
      reservation.payment_id = payment.id
      reservation.save!

      redirect_to complete_reservations_path

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_reservation_path
      end

  end
end
