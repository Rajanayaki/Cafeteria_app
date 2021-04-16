Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "home#index"
  resources :menu_categories
  resources :menu_items
  resources :order_items
  resources :orders
  resources :carts
  resources :users
  get 'pending_orders' => 'orders#pending_orders' ,as: :pending_orders
  get 'delivered_orders' => 'orders#delivered_orders', as: :delivered_orders
  get 'customers' => 'users#customers', as: :customers 
  get 'clerks' => 'users#clerks', as: :clerks 
  get 'admins' => 'users#admins', as: :admins 
  post 'add_new_users' => 'users#add_new_users', as: :add_new_users
  get 'dashboard' => 'dashboard#index', as: :dashboard
end
