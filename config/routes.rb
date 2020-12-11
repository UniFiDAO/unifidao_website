Rails.application.routes.draw do
  resources :email_links

  get 'welcome/index'

  #devise_for :users
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      confirmations: 'users/confirmations',
      passwords: 'users/passwords'
  }

  resources :users

  root 'welcome#index'
end
