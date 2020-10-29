Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: :index
  resources :items, only: [:show, :new]
  resources :cards, only: :show
  resources :buyers, only: :show
  resources :mypages, only: [:show, :destroy, :new]
  root "messages#index"
end
