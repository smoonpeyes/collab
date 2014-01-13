Collab::Application.routes.draw do

  resources :projects
  resources :collaborations

  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users, only: [:show, :index]

  resources :charges
  resources :subscriptions

  get "about" => 'welcome#about'
  get "pricing" => 'welcome#pricing'

  root :to => 'welcome#index'
end