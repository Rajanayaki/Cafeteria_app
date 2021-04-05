Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :menu_categories
  get 'dashboard' => 'dashboard#index', as: :dashboard


end
