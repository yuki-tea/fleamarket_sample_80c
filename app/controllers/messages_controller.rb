class MessagesController < ApplicationController
  def index
    @items = Item.all

  end
end
