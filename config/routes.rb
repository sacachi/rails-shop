Rails.application.routes.draw do
  resources :orders
  resources :carts
  devise_for :users, path: 'users', controllers: { registrations: 'users/registrations' }
  get '/search' => 'search#search', :as => 'search'
  get '/search/:query' => 'search#index'
  namespace :shop_account do
    resources :categories
    resources :products
    resources :shop_orders
  end
  resources :categories, only: %i[show index]
  resources :products, only: %i[show index]
  get 'shop_admin/index'
  root to: 'pages#home'
  devise_for :shop_accounts
end
