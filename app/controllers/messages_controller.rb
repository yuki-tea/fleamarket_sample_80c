class MessagesController < ApplicationController
  def index
    @image = Image.includes(:image).order('created_at DESC')
  end
end
