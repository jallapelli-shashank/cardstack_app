class UpdateAmountTypeInBills < ActiveRecord::Migration[8.1]
  def change
    change_column :bills, :amount, :decimal, precision: 10, scale: 2 
  end
end
