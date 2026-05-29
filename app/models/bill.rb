class Bill < ApplicationRecord
  belongs_to :card

  validates :month, :year, :amount, presence: true
end
