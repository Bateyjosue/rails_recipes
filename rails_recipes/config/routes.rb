Rails.application.routes.draw do
  # get 'food/index'
  # get 'food/show'
  # get 'food/new'
  # get 'food/create'
  # get 'food/destroy'
  # get 'home/index'
  # devise_for :users
  devise_for :users, path: 'auth',
                     path_names: {
                       sign_in: 'login',
                       sign_out: 'logout',
                       password: 'secret',
                       confirmation: 'verification',
                       unlock: 'unblock',
                       registration: 'register',
                       sign_up: 'cmon_let_me_in'
                     }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  
  resources :food, except: [:update]
  resources :users do
  end
end
