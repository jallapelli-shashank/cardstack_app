class RenameTitleAndTypeColumnsInCards < ActiveRecord::Migration[8.1]
  def change
    rename_column :cards, :title, :name
    rename_column :cards, :type, :card_type
  end
end
