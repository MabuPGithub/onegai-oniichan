Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { admins: "admins/registrations" }
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  get '/account/:id' => 'users#account', as: 'account'
  get '/pre-orders' => 'users#pre_orders', as: 'pre_orders'
  get '/nendoroids' => 'users#nendoroids', as: 'nendoroids'
  get '/in-stock'  => 'users#in_stock', as: 'in_stock'
  get '/request-nendo'  => 'users#request_nendo', as: 'request_nendo'
  get '/buy-nendo'  => 'users#buy_nendo', as: 'buy_nendo'

  get '/admins' => 'admins#index', as: 'dashboard'
  get '/all-transactions' => 'admins#all_transactions', as: 'all_transactions'
  get '/transaction-status' => 'admins#transaction_status', as: 'transaction_status'
  get '/orders' => 'admins#orders', as: 'orders'
  get '/upload-nendo' => 'admins#upload_nendo', as: 'upload_nendo'

  get "/", to: "users#index", :as => :user_root
  get "/admins", to: "admins#index", :as => :admin_root

  resources :admins
  resources :users
end
