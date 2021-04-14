Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "home#index"
  resources :menu_categories
  resources :menu_items
  resources :order_items
  resources :orders
  resources :carts
  get 'dashboard' => 'dashboard#index', as: :dashboard
end
