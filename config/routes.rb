Rails.application.routes.draw do
  devise_for :users
  resources :accounts

  get 'activity/mine'
  
  get 'activity/feed'

  root to: 'activity#mine'
end
