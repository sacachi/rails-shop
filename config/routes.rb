Rails.application.routes.draw do
  devise_for :users, path: 'users'
  get '/search' => 'search#search', :as => 'search'
  get '/search/:query' => 'search#index'
  get 'search/index'
  get 'categories/index'
  get 'categories/show'
  get 'products/index'
  get 'products/show'
  namespace :shop_account do
    resources :categories
    resources :products
  end
  resources :categories, only: %i[show index]
  resources :products, only: %i[show index]
  get 'shop_admin/index'
  root to: 'pages#home'
  devise_for :shop_accounts
end
