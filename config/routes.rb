Collab::Application.routes.draw do

  resources :projects

  devise_for :users
  resources :users, only: [:show, :index]

  resources :charges

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end