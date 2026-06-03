class CardsController < ApplicationController
  before_action :require_authentication
  before_action :set_card, only: %i[ show edit update destroy ]

  def index
    @cards = Current.user.cards.all
  end

  def show
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

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to cards_path, notice: "Card updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path, notice: "Card deleted successfully"
  end

  private

  def set_card
    @card = Current.user.cards.find(params[:id])
  end

  def card_params
    params.expect(card: [:name, :number, :milestones_string, :bank, :expiry_month, :expiry_year])
  end
end
