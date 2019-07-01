Rails.application.routes.draw do
  namespace :shop_account do
    resources :categories
    resources :products
  end
  resources :categories, only: [:show, :index]
  resources :products, only: [:show, :index]
  get 'shop_admin/index'
  root to: 'pages#home'
  devise_for :shop_accounts
end
