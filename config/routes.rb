Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: :index
  resources :items, except: :show
  resources :cards, only: :show
  resources :buyers, only: :show
  resources :mypages, only: [:show, :destroy, :new]

  resources :items do
    resources :comments,  only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
      get 'search'
      get 'post_done'
      get 'delete_done'
      get 'detail_search'
      get 'update_done'
    end
  end

  root "messages#index"
  
end
