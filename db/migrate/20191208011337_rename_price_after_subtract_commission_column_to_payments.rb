class RenamePriceAfterSubtractCommissionColumnToPayments < ActiveRecord::Migration[5.2]
  def change
    rename_column :payments, :price_after_subtract_commission, :amount_after_subtract_commission
  end
end
