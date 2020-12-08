Rails.application.routes.draw do
  resources :email_links
  get 'welcome/index'

  devise_for :users

  root 'welcome#index'
end
