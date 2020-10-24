Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: :index
  resources :listings, only: :new
  resources :users, only: [:show, :destroy]
  resources :cards, only: :show
  resources :buyers, only: :show
  resources :mypages, only: [:show, :destroy]
  root "messages#index"
end