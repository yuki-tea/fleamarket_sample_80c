Rails.application.routes.draw do
  get 'purchases/index'
  get 'purchases/done'
  devise_for :users
  resources :messages, only: :index

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  resources :purchases, only: [:index] do
    collection do
      get 'index', to: 'purchases#index'
      post 'pay', to: 'purchases#pay'
      get 'done', to: 'purchases#done'
    end
  end

  resources :buyers, only: :show
  resources :mypages, only: [:show, :destroy, :new]

  resources :items do
    collection do
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
  end
  
  root "messages#index"
  
end
