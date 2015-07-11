Rails.application.routes.draw do

  resources :farms
  devise_for :users, controllers: { registrations: "registrations"}
  root 'pages#home'

end
