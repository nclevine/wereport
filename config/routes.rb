Rails.application.routes.draw do
  resources :categories

  resources :stories do
    resources :comments, shallow: true
  end

  resources :neighborhoods do
    resources :locations, shallow: true
  end

  devise_for :users

  get '/home', to: 'home#home'
  root 'home#home'

  post '/stories/:story_id/mark_important', to: 'stories#mark_important'
  post '/stories/:story_id/mark_unimportant', to: 'stories#mark_unimportant'
end
