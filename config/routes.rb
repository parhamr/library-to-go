# encoding: utf-8

LibraryToGo::Application.routes.draw do

  devise_for :users

  resources :users

  get "static/index"

  require 'sidekiq/web'
  require 'sidekiq/util'
  mount Sidekiq::Web => '/sidekiq'

  match '/auth/:provider/callback' => 'authentications#create'

  namespace :api, :path => "api/v1" do
    scope :v1 do
      # TODO
    end
  end

  namespace :admin do
    match 'home' => 'home#index'
    resources :users
    resources :pages
    # TODO: payment integration
    resources :purchases
    resources :line_items
    resources :payments
  end

  root :to => 'static#index'

  controller :pages do
    get '/legal' => :legal
    get '/about' => :about
    get '/privacy' => :privacy
    get '/help' => :help
    get '/support' => :support
    get '/faq' => :faq
    get '/:slug' => :show
    # Handles the case of testing the action itself
    get :show if Rails.env.test?
  end

end
