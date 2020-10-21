Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: :index
  resources :listings, only: :new
  root "messages#index"
  get "users/show"
  get "users/logout"
  get "cards/show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
