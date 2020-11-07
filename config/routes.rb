Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: :index
  resources :cards, only: :show
  resources :buyers, only: :show
  resources :mypages, only: [:show, :destroy, :new]
  resources :purchases, only: :index

  resources :items do
    collection do
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
  end
  
  root "messages#index"
  
end
