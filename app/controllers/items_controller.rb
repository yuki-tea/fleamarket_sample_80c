class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  
  def index
    @item = Item.includes(:images).order('created_at DESC')
  end

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
    # @category_children = Category.find(@category_parent_array).children
    # @category_grandchildren = Category.find(@category_children).children
    
    # binding.pry
    
    if @item.save
      # saling_items = SalingItems.new(item_id: @item.id, saler_id: params[:user_id], status: "出品中")
      # saler = Saler.new(item_id: @item.id, user_id: params[:user_id])
            
        redirect_to root_path, notice: "出品が完了しました"
      else
        render :new
        flash.now[:alert] = "商品出品に失敗しました"
      end
    # else
    #   flash.now[:alert] = '入力されていない項目があります。'
    #   render :new
    # end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end


  private

  def item_params
    params.require(:item).permit( :name, :description, :category_id, :brand, :item_status_id, :shipping_charge_id,:prefecture_id , :handling_time_id,:price, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   redirect_to action: :index unless user_signed_in?
  # end

end