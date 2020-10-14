class ItemsController < ApplicationController

  def new
     @item = Item.new
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
    params.require(:item).permit(user_ids: [] , :name. :description, categories_id: [], :brand, item_statuses_id: [], shipping_charges_id: [],prefectures_id: [], :price)
  end

end
