class RemoveCardNumberColumn < ActiveRecord::Migration[8.1]
  def change
    remove_column :cards, :card_number, :string
  end
end
