Rails.application.routes.draw do
  get 'landing/index'
  devise_for :users

  root to: 'landing#index'
end
