class MessagesController < ApplicationController
  def index
    # @image = Image.includes(:image).order('created_at DESC')
    # @item = Item.includes(:images).order('created_at DESC')
    @item = Item.find(params[:id])
  end
end
