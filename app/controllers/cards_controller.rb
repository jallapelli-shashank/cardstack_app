class CardsController < ApplicationController
  before_action :require_authentication

  def index
    @cards = Current.user.cards.all
  end

  def show
    @card = Current.user.cards.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    @card = Current.user.cards.build(card_params)

    if @card.save
      redirect_to cards_path, notice: "Card added successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def card_params
    params.expect(card: [:name, :card_number, :card_type, :bank, :expiry_month, :expiry_year])
  end
end
