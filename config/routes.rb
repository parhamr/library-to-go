# encoding: utf-8

LibraryToGo::Application.routes.draw do

  devise_for :users

  require 'sidekiq/web'
  require 'sidekiq/util'
  mount Sidekiq::Web => '/sidekiq'

  root :to => 'pages#home'

  match '/auth/:provider/callback' => 'authentications#create'

  namespace :api, :path => "api/v1" do
    scope :v1 do
      # TODO
    end
  end

  namespace :admin do
    match '/' => 'static#index'
    match 'home' => 'static#index'
    resources :users
    resources :pages
    resources :roles
    resources :items do
      resources :item_instances
    end
    resources :locations
    resources :organizations
    resources :people
    # TODO: payment integration
    #resources :purchases
    #resources :line_items
    #resources :payments
  end

  resources :items do
    resources :item_instances
    resources :circulations
  end

  resources :users do
    resources :addresses
    resources :circulations
  end

  resources :locations do
    resources :addresses
    get 'map'
  end

  resources :organizations do
    resources :locations
    resources :circulations
    get 'map'
  end

  resources :people do
    resources :addresses
  end

  controller :pages do
    get '/legal' => :legal
    get '/about' => :about
    get '/privacy' => :privacy
    get '/help' => :help
    get '/support' => :support
    get '/faq' => :faq
    get '/:slug' => :show
    # Handles the case of testing the action itself
    #get :show if Rails.env.test?
  end

end
