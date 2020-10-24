class ItemsController < ApplicationController
  
  def index
    @item = Item.includes(:images).order('created_at DESC')
  end

  def new
     @item = Item.new
     @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if item.save
      redirect_to root_path, notice: "出品が完了しました"
    else
      render.new
      flash.now[:alert] = "商品出品に失敗しました"
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def item_params
    params.require(:item).permit( :name, :description, :categories_id, :brand, :item_statuses_id, :shipping_charges_id,:prefectures_id , :price, images_attributes: [:image].merge(user_id: current_user.id))
  end
end
end