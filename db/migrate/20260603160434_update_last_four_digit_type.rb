class UpdateLastFourDigitType < ActiveRecord::Migration[8.1]
  def change
    change_column :cards, :last_four_digits, :integer, using: "last_four_digits::integer", null: false
  end
end
