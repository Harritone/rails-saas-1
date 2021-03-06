Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :accounts
  resources :teams, path: 't'

  get 'user/me', to: 'users#me', as: 'my_settings'
  patch 'users/update_me', to: 'users#update_me', as: 'update_my_settings'
  get 'user/password', to: 'users#password', as: 'my_password'
  patch 'user/update_password', to: 'users#update_password', as: 'my_update_password'

  get 's/new/(:date)', to: 'standups#new', as: 'new_standup'
  get 's/edit/(:date)', to: 'standups#edit', as: 'edit_standup'
  resources :standups, path: 's', except: [:new, :edit]

  scope 'account', as: 'account' do
    resources :users
  end

  get 'activity/mine'
  
  get 'activity/feed'

  get 'dates/:date', to: 'dates#update', as: 'update_date'

  root to: 'activity#mine'
end
