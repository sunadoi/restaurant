ActiveAdmin.register Payment do
  permit_params :email, :description, :customer_id, :customer_name, :payment_date, :amount_after_subtract_commission
  
  filter :email
  filter :description
  filter :payment_date, as: :date_time_range, placeholder: "終了"
  filter :amount_after_subtract_commission

  index do 
    column :id
    column :email
    column :description
    column :payment_date
    column :amount_after_subtract_commission
    actions
  end

  show do
    attributes_table do
      row 'id' do
        resource.id
      end
      row 'email' do
        resource.email
      end
      row 'description' do
        resource.description
      end
      row 'payment_date' do
        resource.payment_date
      end
      row 'amount_after_subtract_commission' do
        resource.amount_after_subtract_commission
      end
    end
  end
end
