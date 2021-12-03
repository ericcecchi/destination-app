# frozen_string_literal: true

Rails.application.routes.draw do
  get '/cities',     to: 'locales#index'
  resources :recommendations
  root   'static_pages#home'
  get    '/about',   to: 'static_pages#about'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :guides, only: %i[new create]
  resources :account_activations, only: %i[create edit]
  resources :password_resets, only: %i[new create edit update]
  resources :recommendations, except: %i[index]
end
