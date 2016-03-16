Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  get 'pages/home', to: 'pages#home'
  get 'pages/about', to: 'pages#about'

  resources :articles
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  
end