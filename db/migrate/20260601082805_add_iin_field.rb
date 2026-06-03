class AddIinField < ActiveRecord::Migration[8.1]
  def change
    add_column :cards, :iin, :integer, null: false
  end
end
