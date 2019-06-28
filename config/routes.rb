Rails.application.routes.draw do
  resources :categories
  resources :products
  get 'shop_admin/index'
  root to: 'pages#home'
  devise_for :shop_accounts
end
