class ChangeUidColumnType < ActiveRecord::Migration[8.1]
  def change
      change_column :cards, :uid, :string
  end
end
