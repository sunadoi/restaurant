class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :email
      t.text :desctioption
      t.string :currency
      t.integer :customer_id
      t.string :customer_name
      t.datetime :payment_date
      t.string :payment_status
      t.integer :uuid
      t.integer :charge_id
      t.integer :stripe_commission
      t.integer :price_after_subtract_commission
      t.string :receipt_url
      t.timestamps
    end
  end
end
