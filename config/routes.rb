Rails.application.routes.draw do
  get 'shop_admin/index'
  root to: 'pages#home'
  devise_for :shop_accounts
end
