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

  resources :users

  resources :teams do
    get 'should_join', on: :member
    get 'join_team', on: :member
    get 'new_team', on: :collection
  end

  root 'welcome#index'

  devise_scope :user do
    get '/sign_out', to: 'devise/sessions#destroy'
  end
end
