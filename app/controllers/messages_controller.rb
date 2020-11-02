class MessagesController < ApplicationController
  def index
    @item = Item.includes(:images).order('created_at DESC')
  end
end
