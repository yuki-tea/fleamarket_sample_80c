class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]


  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = Category.where(ancestry: nil) 
  end

  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children    
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  def create
    @item = Item.new(item_params)
    @category_parent_array = Category.where(ancestry: nil) 
    if @item.save
        redirect_to root_path, notice: "出品が完了しました"
    else
      render :new
      flash.now[:alert] = "商品出品に失敗しました"
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    # if params[:item][:images_attributes] && @item.update(edit_item_params)
    #   redirect_to root_path, notice: "商品情報を編集しました"
    # else
    #   render :edit
    # end
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "商品の編集が完了しました"
    else
      redirect_to edit_item_path(@item), notice: "必須項目を入力してください"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  def show
    # 商品出品者のidを入れる
    @item = Item.find(params[:id])
    @user = @item.user
    @category_grandchild = @item.category
    @category_child = @category_grandchild.parent
    @category_parent = @category_child.parent
    
  end



  private

  def item_params
    params.require(:item).permit( :name, :description, :category_id, :brand, :item_status_id, :shipping_charge_id,:prefecture_id , :handling_time_id,:price, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def edit_item_params
    params.require(:item).permit(:name, :description, :category_id, :brand, :item_status_id, :shipping_charge_id,:prefecture_id , :handling_time_id,:price, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end