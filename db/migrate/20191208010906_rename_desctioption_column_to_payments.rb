class RenameDesctioptionColumnToPayments < ActiveRecord::Migration[5.2]
  def change
    rename_column :payments, :desctioption, :description
  end
end
