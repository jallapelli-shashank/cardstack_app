class AddCardRefToBills < ActiveRecord::Migration[8.1]
  def change
    add_reference :bills, :card, null: false, foreign_key: true, type: :uuid
  end
end
