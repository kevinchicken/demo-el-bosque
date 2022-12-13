Rails.application.routes.draw do
  get 'landing/index'
  get 'landing/mercadopago'
  get 'news/carousel'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  post '/api_login',    to: 'api/sessions#login'
  get '/api_logout',    to: 'api/sessions#logout'
  get '/api_news',      to: 'api/news#pages'
  get '/api_news_show', to: 'api/news#show'
  get '/api_profile',   to: 'api/users#profile'
  get 'news/new',       to: 'news#new' # , as: 'new_news' # new news
  get 'news/:id',       to: 'news#show', as: 'news_show' # show
  post 'news',          to: 'news#create' # create news
  get 'news/:id/edit',  to: 'news#edit', as: 'edit_new' # edit
  patch 'news/:id',     to: 'news#update', as: 'update_news' # update (as needed)
  put 'news/:id',       to: 'news#update' # update (full replacement)
  delete 'news/:id',    to: 'news#destroy', as: 'destroy_news' # destroy
  root                  to: 'landing#index'
end
