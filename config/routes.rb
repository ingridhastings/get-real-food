Rails.application.routes.draw do


  resources :farms, :reviews, :user

  resources :reviews

  devise_for :users, controllers: { registrations: "registrations"}

  root 'pages#home'

  get 'dashboard', to: 'pages#dashboard'

end
