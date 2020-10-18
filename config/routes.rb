Rails.application.routes.draw do
<<<<<<< Updated upstream
  devise_for :users
  resources :messages, only: :index
  resources :listings, only: :new
=======
  get 'buyers/index'
  get 'messages/index'
>>>>>>> Stashed changes
  root "messages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
