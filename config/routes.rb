Rails.application.routes.draw do
  resources :messages, only: :index
  resources :listings, only: :new
  resources :buyers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
