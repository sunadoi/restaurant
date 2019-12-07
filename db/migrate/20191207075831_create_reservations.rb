class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :reservation_date
      t.bigint :user_id, foreign_key: true
      t.integer :count
      t.bigint :payment_id, foreign_key: true
      t.timestamps
    end
  end
end
