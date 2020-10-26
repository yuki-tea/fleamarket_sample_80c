class ItemsController < ApplicationController
  
  def index
    @item = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
    @item.users << current_user
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "出品が完了しました"
    else
      render :new
      flash.now[:alert] = "商品出品に失敗しました"
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
  private

  def item_params
    params.require(:item).permit( :name, :description, :category_id, :brand, :item_status_id, :shipping_charge_id,:prefecture_id , :handling_time_id,:price, images_attributes: [:image].merge(user_id: current_user.id))
 end
end