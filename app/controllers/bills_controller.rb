class BillsController < ApplicationController
  before_action :set_card
  before_action :set_bill, only: %i[show edit destroy update]

  def index
    @bills = @card.bills.all
  end

  def show
    @bill = @card.bills.find(params[:id])
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

  def edit
  end

  def update
    if @bill.update(bill_params)
      redirect_to card_bills_path, notice: "Bill updated successfully"
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @bill.destroy

    redirect_to card_bills_path, notice: "Bill deleted successfully"
  end

  private

  def set_card
    @card = Current.user.cards.find(params[:card_id])
  end

  def set_bill
    @bill = @card.bills.find(params[:id])
  end

  def bill_params
    params.expect(bill: [:month, :year, :amount])
  end
end
