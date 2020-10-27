Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: :index
  resources :listings, only: :new
  resources :cards, only: :show
  resources :buyers, only: :show
  resources :mypages, only: [:show, :destroy, :new]
  resources :item_details, only: :show
  root "messages#index"
end
