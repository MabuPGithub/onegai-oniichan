Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
  devise_for :admins, path: 'admins', controllers: { admins: "admins/registrations" }
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  get '/account/:id' => 'users#account', as: 'account'
  get '/pre-orders' => 'users#pre_orders', as: 'pre_orders'
  get '/nendoroids' => 'users#nendoroids', as: 'nendoroids'
  get '/in-stock'  => 'users#in_stock', as: 'in_stock'
  get '/request-nendo'  => 'users#request_nendo', as: 'request_nendo'
  get '/buy-nendo'  => 'users#buy_nendo', as: 'buy_nendo'
  get '/nendoroid/:id' => 'users#view_nendo', as: 'view_nendo'

  get '/admins' => 'admins#index', as: 'dashboard'
  get '/all-transactions' => 'admins#all_transactions', as: 'all_transactions'
  get '/transaction-status' => 'admins#transaction_status', as: 'transaction_status'
  get '/orders' => 'admins#orders', as: 'orders'
  post '/upload-nendo' => 'admins#create', as: 'upload_nendo'

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  
  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

  get "/", to: "users#index", :as => :user_root
  get "/admins", to: "admins#index", :as => :admin_root

  resources :admins
  resources :users
  resources :orders
end
