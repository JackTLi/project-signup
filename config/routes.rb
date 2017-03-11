Rails.application.routes.draw do

  root 'products#index'

  get 'auth/:provider/callback', to: 'sessions#create'
	get 'auth/failure', to: redirect('/')
	get 'signout', to: 'sessions#destroy', as: 'signout'


  resources :users
  resources :sessions, only: [:create, :destroy]
  resources :products, only: [:create, :new, :index, :show] do
    post 'add_like'
    post 'remove_like'
    get 'likes_count'
  end

  namespace :api do
    namespace :v1 do
		  get 'tags' => 'tags#search'
		end
	end

end
