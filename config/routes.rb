Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  devise_for :users, controllers: { registrations: "registrations" }
  resources :accounts

  get 'activity/mine'
  
  get 'activity/feed'

  root to: 'activity#mine'
end
