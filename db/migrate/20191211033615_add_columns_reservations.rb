class AddColumnsReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :amount, :int
  end
end
