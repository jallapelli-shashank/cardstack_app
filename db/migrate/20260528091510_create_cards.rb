class CreateCards < ActiveRecord::Migration[8.1]
  def change
    create_table :cards, id: :uuid do |t|
      t.string :title
      t.string :type
      t.string :bank
      t.string :number
      t.string :last_four_digits
      t.json :milestones
      t.string :expiry_month
      t.string :expiry_year

      t.timestamps
    end
  end
end
