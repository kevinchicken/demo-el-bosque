Rails.application.routes.draw do
  get 'landing/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: 'landing#index'
end
