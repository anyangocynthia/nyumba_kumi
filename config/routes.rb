Rails.application.routes.draw do
  resources :attendees

  resources :events

  resources :branches

  resources :companies

  resources :services

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
