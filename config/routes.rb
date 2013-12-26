Collab::Application.routes.draw do

  resources :projects

  devise_for :users
  resources :users, only: [:show, :index]

  resources :charges
  resources :subscriptions

  match "about" => 'welcome#about', via: :get
  match "pricing" => 'welcome#pricing', via: :get

  root :to => 'welcome#index'
end