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
  end


  private

  def item_params
    params.require(:item).permit(user_ids: [] , :name. :description, categories_id: [], :brand, item_statuses_id: [], shipping_charges_id: [],prefectures_id: [], :price, images_attributes: [:image])
  end

end
