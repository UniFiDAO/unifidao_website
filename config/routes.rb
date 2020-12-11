Rails.application.routes.draw do
  resources :email_links do
    get "validate", on: :collection
  end

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
