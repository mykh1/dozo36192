Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
}

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end

  root to: "items#index"

end
