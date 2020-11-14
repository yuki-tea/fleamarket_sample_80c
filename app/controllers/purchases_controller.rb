class PurchasesController < ApplicationController
  before_action :card_user, only: [:index, :pay]

  require 'payjp'

  def card_user
    @card = Card.find_by(user_id: current_user.id)
  end


  def index
    @item = Item.find(params[:id])
    # 登録された情報がない場合、登録画面に移動
    if @card.blank?
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
      :customer => @card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
    )
    @item.buyer_id = current_user.id
    @item.save
    # セーブできなかったときのif文記述
    redirect_to root_path #完了画面に移動
    end
  end