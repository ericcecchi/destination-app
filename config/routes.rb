# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: %i[create edit]
  resources :password_resets, only: %i[new create edit update]
  resources :posts, except: %i[index]
end
