class ApplicationController < ActionController::Base
  before_action :basic_auth
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, :delivery_first_name, :delivery_last_name, :delivery_first_name_kana, :delivery_last_name_kana, :prefecture_id, :zip_code, :municipality, :street_number, :building_name, :telephone_number] )
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
end
