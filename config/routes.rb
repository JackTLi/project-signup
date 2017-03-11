Rails.application.routes.draw do

<<<<<<< HEAD
  resources :records
  root 'dashboards#index'
=======
  root 'products#index'
>>>>>>> 15a438db381c0e34b947b175a295634a9febe0f8

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
