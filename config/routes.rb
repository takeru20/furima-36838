Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users
  resources :items
  resources :products
  post 'items/new' => 'items#new'
end