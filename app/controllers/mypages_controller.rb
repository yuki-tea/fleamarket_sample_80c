class MypagesController < ApplicationController
  def new
    
  end
  
  def show
    @users = User.find(params[:id])
  end

  def profile
  end

  def destroy
  end

  def index
  end
end
