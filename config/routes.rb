Rails.application.routes.draw do
  resources :categories

  resources :stories do
    resources :comments, shallow: true
  end

  resources :neighborhoods do
    resources :locations, shallow: true
  end

  devise_for :users

  get '/home', to: 'categories#home'
  root 'categories#home'
end
