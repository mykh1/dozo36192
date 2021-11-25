Rails.application.routes.draw do

  # namespace :admin do
  #   get 'users/new'
  #   # post 'users/create'
  # end

  # devise_for :users, skip: 'registrations'
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
  }

  devise_scope :user do
    get '/users', to: 'users/registrations#show'
  end


  root to: "items#index"
  resources :items
  resources :orders, only: [:index, :create, :show]
  resource :nickname, only: [:edit, :update]
  namespace :admin do
    resources :users, only: [:new, :create]
  end


end
 