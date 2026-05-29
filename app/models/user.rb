class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :bills, through: :cards

  validates :name, :email_address, :password, presence: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
