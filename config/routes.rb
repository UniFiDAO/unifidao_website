Rails.application.routes.draw do
  resources :events do
    get 'ical', on: :member
  end

  resources :email_links

  resources :admins do
    get 'users', on: :collection
    get 'events', on: :collection
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
