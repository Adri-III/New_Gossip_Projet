Rails.application.routes.draw do

  
  root to: 'pages#home' 

  get '/welcome', to: 'pages#welcome'
  get '/team', to: 'pages#team'
  get '/contact', to: 'pages#contact'

  resources :posts

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end