Rails.application.routes.draw do

  get 'swits', to: 'swits#home'
  get 'users/register'
  post 'users/register', to: 'users#create'
  delete 'sessions', to: 'sessions#destroy'
  resources :users
  resources :sessions
  resources :swits
  root 'sessions#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
