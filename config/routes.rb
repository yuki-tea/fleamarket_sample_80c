Rails.application.routes.draw doUpdated upstream
  devise_for :users
  resources :messages, only: :index
  resources :listings, only: :new
  get 'buyers/index'
  get 'messages/index'
  root "messages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
