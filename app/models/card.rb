class Card < ApplicationRecord
  belongs_to :user
  has_many :bills, dependent: :destroy
  enum :bank, {
    axis: "Axis",
    hdfc: "HDFC",
    amex: "American Express",
    hsbc: "HSBC",
    icici: "ICICI",
    indusind: "IndusInd"
  }

  attr_accessor :number

  before_validation :extract_card_details

  validates :name, :iin, :last_four_digits, :expiry_month, :expiry_year, :bank, presence: true
  validates :last_four_digits, length: { is: 4 }
  validate :number_is_valid, on: :create

  def total_spent
    bills.sum(:amount)
  end

  def milestones_string
    milestones.map(&:)
    milestones&.join(";") || ""
  end

  def milestones_string=(value)
    self.milestones = value.gsub(",", "").split(";").map(&:to_i)
  end

  private

  def extract_card_details
    return if number.blank?

    digits = number.gsub(/\D/, "")
    detector = CreditCardValidations::Detector.new(digits)

    self.card_type = detector.brand
    self.iin = digits.first(6).to_i
    self.last_four_digits = digits.last(4)
  end

  def number_is_valid
    digits = number.to_s.gsub(/\D/, "")
    detector = CreditCardValidations::Detector.new(digits)

    errors.add(:number, "Please enter a valid card number") if detector.brand.nil?
  end
end
