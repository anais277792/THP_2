Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'gossips#index'

  resources :gossips
  resources  :users, except: [:index]
  resources :cities , only: [:show, :create]
  resources :sessions, only: [:create, :new, :destroy]
  resources :comments
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
end
