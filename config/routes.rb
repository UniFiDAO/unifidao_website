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
  get 'welcome/new'
  get 'welcome/check'

  #devise_for :users
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      confirmations: 'users/confirmations',
      passwords: 'users/passwords'
  }

  resources :users, :path => :teams, as: :users
  #resources :teams, as: :users

  root 'welcome#index'

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
