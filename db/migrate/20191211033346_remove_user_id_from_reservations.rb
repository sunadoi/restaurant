class RemoveUserIdFromReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :user_id, :int
  end
end
