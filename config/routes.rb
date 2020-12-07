Rails.application.routes.draw do
  resources :order_items
  resources :orders
  resources :items
  resources :categories
  resources :customers, only: [:show, :create, :update, :delete, :destroy]

  get '/signup', to: 'customers#new'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
