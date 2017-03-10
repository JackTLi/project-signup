Rails.application.routes.draw do

  root 'dashboards#index'

  get 'auth/:provider/callback', to: 'sessions#create'
	get 'auth/failure', to: redirect('/')
	get 'signout', to: 'sessions#destroy', as: 'signout'


  resources :users
  resources :sessions, only: [:create, :destroy]
  resources :products, only: [:create, :new]
end
