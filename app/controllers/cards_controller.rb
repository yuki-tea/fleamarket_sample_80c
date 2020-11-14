class CardsController < ApplicationController
  before_action :card_user, only: [:new, :show, :destroy]

  require "payjp"

  def card_user
    @card = Card.find_by(user_id: current_user.id)
  end

  def index
  end
  
  def new
    # データが存在するかどうかを知りたい時
    # exists?を使います。trueかfalseを返します。
    redirect_to action: "show", id: @card.id  if @card.present? 
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token']
      )
      # 一番最初に紐付けられたカード情報は default_card として登録されます。
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to root_path
      else
        redirect_to action: "pay"
      end
    end
  end

  def show
    if @card.blank?
      # 未登録なら新規会員登録
      redirect_to action: "new" 
    else
      # .envからAPI秘密鍵を呼び出し
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # ログインユーザーのクレジットカード情報からPay.jpに登録されているカスタマー情報を引き出す
      customer = Payjp::Customer.retrieve(@card.customer_id)
      # カスタマー情報からカードの情報を引き出す
      @customer_card = customer.cards.retrieve(@card.card_id)

      ##カードのアイコン表示のための定義づけ
      @card_brand = @customer_card.brand
      # case @card_brand
      # when "Visa"
      #   # 例えば、Pay.jpからとってきたカード情報の、ブランドが"Visa"だった場合は返り値として
      #   # (画像として登録されている)Visa.pngを返す
      #   @card_src = "visa.png"
      # when "JCB"
      #   @card_src = "jcb.png"
      # when "MasterCard"
      #   @card_src = "master.png"
      # when "American Express"
      #   @card_src = "amex.png"
      # when "Diners Club"
      #   @card_src = "diners.png"
      # when "Discover"
      #   @card_src = "discover.png"
      # end
      ## 有効期限'月'を定義(.exp_monthはAPIメソッド)
      @exp_month = @customer_card.exp_month.to_s
      ## 有効期限'年'を定義(.exp_yearはAPIメソッド) .sliceは確認
      @exp_year = @customer_card.exp_year.to_s.slice(2,3)
    end
  end

  def destroy
    # blank?中身なかったらtrue
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to action: "new"
  end
end