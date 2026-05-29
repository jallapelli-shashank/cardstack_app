class Card < ApplicationRecord
  belongs_to :user
  has_many :bills, dependent: :destroy

  validates :name, :card_type, :bank, :card_number, :expiry_month, :expiry_year, presence: true
  validates :card_number, uniqueness: true

  encrypts :card_number
end
