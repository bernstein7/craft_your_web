Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#main'
  get '/dashboard', to: 'dashboard#main'

  resources :sessions
  match '/log_out', via: [:get, :post], to: 'sessions#destroy'
  resources :users, only: [:new, :create]
end
