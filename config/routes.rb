Rails.application.routes.draw do
  
  namespace :admin do
    resources :users
  end

  #get 'users/new'
#
  #get 'users/create'
#
  #get 'users/show'

  get '/signin', to: "sessions#new"

  post '/signin', to: 'sessions#create'

  root "projects#index"

  resources :projects do
  	resources :tickets
  end

  resources :users
  
end
