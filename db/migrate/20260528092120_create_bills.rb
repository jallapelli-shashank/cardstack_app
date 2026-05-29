class CreateBills < ActiveRecord::Migration[8.1]
  def change
    create_table :bills, id: :uuid do |t|
      t.string :month
      t.string :year
      t.decimal :amount

      t.timestamps
    end
  end
end
