class AddBankColumnInCards < ActiveRecord::Migration[8.1]
  def change
    add_column :cards, :bank, :string, null: false
  end
end
