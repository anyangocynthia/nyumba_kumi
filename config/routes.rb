Rails.application.routes.draw do
  resources :accounts

  get 'blog', to: 'articles#index', as: 'blog'
  resources :articles

  devise_for :users, :controllers => {:registrations => "users/registrations", sessions: "users/sessions" }
  resources :incidents

  get '/dashboard', to: 'dashboard#index', as: 'dashboard_index'
  get '/dashboard/blog', to: 'dashboard#blog'

  get '/zohoverify/verifyforzoho', to: 'home#verifyforzoho'

  get 'map', to: 'dashboard#map', as: 'map'

  resources :devices

  # resources :notifications, :defaults => { :format => 'json' }

  resources :notification_types

  resources :group_companies

  resources :contacts

  resources :attendees

  resources :events

  resources :branches

  resources :companies

  resources :services

  # resources :houses

  resources :groups

  resources :appartments

  resources :appartment_residents

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root to: 'home#index'

  # Begining of API routes

  # V1

  namespace :api do
    namespace :v1 do
      match 'sign_up', to: 'home#sign_up', as: 'sign_up', via: "post"
      match 'add_members', to: 'home#add_members', as: 'add_members', via: "post"
      get 'services/:id/companies', to: 'services#companies', as: 'service_companies'
      get 'companies/:id/branches', to: 'companies#branches', as: 'company_branches'
      get 'companies/:id/nearest_branch', to: 'companies#nearest_branch', as: 'company_nearest_branch'
      get 'groups/:id/members', to:'groups#members',as:'group_members'
      get 'services_and_companies', to:'services#services_and_companies',as:'services_and_companies'
      get 'group_services', to:'groups#group_services',as:'group_services'
      get 'group_notifications', to:'groups#notifications',as:'group_notifications'
      match 'verify', to: 'contacts#verify', as: 'verify', via: "post"
      match 'add_services', to: 'home#add_services', as: 'add_services', via: "post"
      match 'panic_menu_actions', to: 'home#panic_menu_actions', as: 'panic_menu_actions', via: "post"
      match 'save_house_details', to: 'contacts#save_house_details', as: 'save_house_details', via: "post"
    end
  end

  # V2

  namespace :api do
    namespace :v2 do
      match 'sign_up', to: 'contacts#create', as: 'sign_up_v2', via: "post"
      match 'invite', to: 'contacts#invite_contacts', as: 'invite_contacts', via: "post"
      get 'contacts', to:'contacts#index',as:'contacts_v2'
      get 'nearby_estates', to:'estates#nearby_estates',as:'nearby_estates'
      get 'estates', to:'estates#index',as:'estates'
      match 'verify', to: 'contacts#verify', as: 'verify', via: "post"
      get 'groups/:id/members', to:'groups#members',as:'group_members'
      get 'group_notifications', to:'groups#notifications',as:'group_notifications_v2'
      get 'group_services', to:'groups#group_services',as:'group_services_v2'
      match 'panic_menu_actions', to: 'home#panic_menu_actions', as: 'panic_menu_actions_v2', via: "post"
      match 'notifications', to: 'notifications#create', as: 'create_notification', via: "post"
    end
  end
  # End of API routes

  # match 'sign_up', to: 'home#sign_up', as: 'sign_up', via: "post"
  # match 'add_members', to: 'home#add_members', as: 'add_members', via: "post"

  match 'login', to: 'sessions#create', as: 'login', via: "post"

  get 'logout', to: 'sessions#destroy', as: 'logout'
  # get 'services/:id/companies', to: 'services#companies', as: 'service_companies'
  # get 'companies/:id/branches', to: 'companies#branches', as: 'company_branches'
  # get 'companies/:id/nearest_branch', to: 'companies#nearest_branch', as: 'company_nearest_branch'
  # get 'groups/:id/members', to:'groups#members',as:'group_members'
  # get 'services_and_companies', to:'services#services_and_companies',as:'services_and_companies'
  # get 'group_services', to:'groups#group_services',as:'group_services'
  # get 'group_notifications', to:'groups#notifications',as:'group_notifications'
  
  # match 'verify', to: 'contacts#verify', as: 'verify', via: "post"
  # match 'add_services', to: 'home#add_services', as: 'add_services', via: "post"
  
  # match 'panic_menu_actions', to: 'home#panic_menu_actions', as: 'panic_menu_actions', via: "post"

  get 'company_incidents', to: 'companies#incidents', as: 'company_incidents'
  get 'unviewed_incidents', to: 'companies#unviewed_incidents', as: 'unviewed_incidents'

  match 'incidents/:id/resolve', to: 'incidents#toggle_resolve', as: 'resolve', via: "post"
  match 'incidents/:id/false_flag', to: 'incidents#toggle_false_flag', as: 'false_flag', via: "post"
  
  match 'incidents/:id/send_message_to_contact', to: 'incidents#send_message_to_contact', as: 'send_message_to_contact', via: "post"

  post "/articles/delete_multiple" => "articles#delete_multiple", as: "delete_multiple_articles"
  post "/articles/add_category" => "articles#add_category", as: "add_category"
end
