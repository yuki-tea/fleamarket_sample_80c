class CategoriesController < ApplicationController

  def show
    @category = Category.roots
    # @items = Item.all
    # @category.each do |category|
    #   @category_items = category.item
    # end
  end
  
end
