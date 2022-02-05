Rails.application.routes.draw do

  # namespace :admin do
  #   get 'users/new'
  #   # post 'users/create'
  # end

  # # devise_for :users, skip: 'registrations'
  # devise_for :users, controllers: {
  #   sessions:      'users/sessions',
  #   passwords:     'users/passwords',
  # }

  # devise_scope :user do
  #   get '/users', to: 'users/registrations#show'
  # end

  devise_for :users, skip: 'registrations', controllers: {
    sessions:       'users/sessions',
    passwords:      'users/passwords',
  }

  devise_scope :user do
    get '/users', to: 'users/registrations#show'
    resource :user_registration,
             except: [:new],
             path: 'users',
             controller: 'users/registrations'
  end

  root to: "items#index"
  resources :items do
    resources :orders, only: [:create]
  end
  resource :nickname, only: [:edit, :update]
  namespace :admin do
    resources :users, only: [:new, :create]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
  

end
 