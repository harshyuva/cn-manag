Rails.application.routes.draw do

  root 'welcome#index'
  devise_for :users
  resources :items
  resources :cards
  resources :pays
  resources :welcome
  resources :cart_items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
