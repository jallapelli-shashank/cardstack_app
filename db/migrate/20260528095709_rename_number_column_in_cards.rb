class RenameNumberColumnInCards < ActiveRecord::Migration[8.1]
  def change
    rename_column :cards, :number, :card_number
  end
end
