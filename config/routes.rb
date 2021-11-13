Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
}

  devise_scope :user do
    get '/users', to: 'users/registrations#new'
    get '/users', to: 'users/registrations#show'
  end

  root to: "items#index"

end
