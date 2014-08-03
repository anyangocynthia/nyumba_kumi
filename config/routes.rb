Rails.application.routes.draw do
  resources :users

  resources :attendees

  resources :events

  resources :branches

  resources :companies

  resources :services

  resources :houses

  resources :groups

  resources :appartments

  resources :appartment_residents

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root to: 'visitors#index'

  match 'login', to: 'sessions#create', as: 'login', via: "post"
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'services/:id/companies', to: 'services#companies', as: 'service_companies'
  get 'companies/:id/branches', to: 'companies#branches', as: 'company_branches'
  get 'companies/:id/nearest_branch', to: 'companies#nearest_branch', as: 'company_nearest_branch'
  get 'groups/:id/members', to:'groups#members',as:'group_members'
end
