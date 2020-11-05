class PurchasesController < ApplicationController

  require 'payjp'

  def index
    card = Card.where(user_id: current_user.id).first
    # 登録された情報がない場合、登録画面に移動
    if card.blank?
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  end


  def done
  end
end
