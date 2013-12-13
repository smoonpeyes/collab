Collab::Application.routes.draw do
  
  resources :projects

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', 
                                    registrations: 'users/registrations' }
  resources :users, only: [:show, :index]

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
