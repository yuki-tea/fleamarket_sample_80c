Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: :index
  resources :listings, only: :new
  resources :users, only: [:show, :destroy]
  resources :cards, only: :show
  resources :items, only: :show
  root "messages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
