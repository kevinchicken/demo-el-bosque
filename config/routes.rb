Rails.application.routes.draw do
  get 'landing/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  post '/api_login',    to: 'api/sessions#login'
  get '/logout',        to: 'api/sessions#logout'
  get '/news',          to: 'api/news#pages'
  get '/news_show',     to: 'api/news#show'
  get '/profile',       to: 'api/users#profile'
  root                  to: 'landing#index'
end
