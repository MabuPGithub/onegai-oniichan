Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: 'users#index'
  get '/account/:id' => 'users#account', as: 'account'
  get '/pre-orders' => 'users#pre_orders', as: 'pre_orders'
  get '/nendoroids' => 'users#nendoroids', as: 'nendoroids'
  get '/in-stock'  => 'users#in_stock', as: 'in_stock'
  get '/request-nendo'  => 'users#request_nendo', as: 'request_nendo'
  get '/buy-nendo'  => 'users#buy_nendo', as: 'buy_nendo'
  resources :users
end
