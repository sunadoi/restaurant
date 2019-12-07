class AddColumnReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :menu_id, :bigint
  end
end
