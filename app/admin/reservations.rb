ActiveAdmin.register Reservation do
  permit_params :reservation_date, :user_id, :count, :payment_id, :menu_id
  
  filter :reservation_date
  filter :user_id
  filter :payment_id
  filter :menu_id
  


  index do
    column :id
    column :reservation_date
    column :user
    column :payment
    column :menu
    actions
  end

end
