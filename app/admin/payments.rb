ActiveAdmin.register Payment do
  permit_params :email, :description, :customer_id, :customer_name, :payment_date, :amount_after_subtract_commission
  
  filter :email
  filter :description
  filter :payment_date
  filter :amount_after_subtract_commission

  index do 
    column :id
    column :email
    column :description
    column :payment_date
    column :amount_after_subtract_commission
    actions
  end
end
