Rails.application.routes.draw do
  resources :email_links do
    get "validate", on: :collection
  end

  get 'welcome/index'

  devise_for :users

  root 'welcome#index'
end
