Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: :index

  resources :cards, only: [:new, :show, :index, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end

  resources :purchases, only: [:index] do
    member do
      get 'index', to: 'purchases#index'
      post 'pay', to: 'purchases#pay'
      get 'done', to: 'purchases#done'
    end
  end

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

