Rails.application.routes.draw do
  namespace :admin do
    get 'restaurants/new'
  end
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users', to: 'users/registrations#show'
  end


  root to: "items#index"
  resource :nickname, only: [:edit, :update]
  resource :admin, only: [:new, :create]
end
 