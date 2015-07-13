Rails.application.routes.draw do

  resources :farms
  resources :reviews
  devise_for :users, controllers: { registrations: "registrations"}
  root 'pages#home'

end
