class MessagesController < ApplicationController
  def index
    @item = Item.all
  end
end
