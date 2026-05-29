class BillsController < ApplicationController
  before_action :set_card

  def index
    @bills = @card.bills.all
  end

  def new
    @bill = @card.bills.new
  end

  def create
    @bill = @card.bills.build(bill_params)

    if @bill.save
      redirect_to card_path(params[:card_id]), notice: "Bill Added Successfully!"
    else
      render :new, status: :unprocessable_content
    end
  end

  private

  def set_card
    @card = Current.user.cards.find(params[:card_id])
  end

  def bill_params
    params.expect(bill: [:month, :year, :amount])
  end
end
