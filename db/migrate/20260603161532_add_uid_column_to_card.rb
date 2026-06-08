class AddUidColumnToCard < ActiveRecord::Migration[8.1]
  def change
    add_column :cards, :uid, :integer, null: false
  end
end
