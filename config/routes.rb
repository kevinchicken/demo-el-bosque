Rails.application.routes.draw do
  get 'login/auth_api'
  get 'landing/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  post '/api_login', to: 'api/login#auth_api'
  root to: 'landing#index'
end
