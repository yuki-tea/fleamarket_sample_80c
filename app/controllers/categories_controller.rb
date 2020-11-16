class CategoriesController < ApplicationController

  def show
    @category = Category.roots
  end
  
end
