ActiveAdmin.register Reservation do
  permit_params :user_name, :reservation_date, :payment_id, :menu_id, :count, :amount, :request
  
  filter :reservation_date, as: :date_time_range
  filter :menu_id

  index do
    column :id
    column :user_name
    column :reservation_date
    column :payment
    column :menu
    column :count
    column :amount
    column :request
    actions
  end

  show do
    attributes_table do
      row "user_name" do
        resource.user_name
      end
      row 'reservation_date' do
        resource.reservation_date
      end
      row "payment" do
        resource.payment
      end
      row "menu" do
        resource.menu
      end
      row "count" do
        resource.count
      end
      row "amount" do
        resource.amount
      end
      row "request" do
        resource.request
      end
    end
  end

end
