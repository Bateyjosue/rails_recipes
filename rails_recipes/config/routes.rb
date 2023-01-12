Rails.application.routes.draw do
  # get 'recipes/index'
  # get 'recipes/new'
  # get 'recipes/create'
  # get 'recipes/destroy'
  devise_for :users
  # devise_for :users, path: 'auth',
  #                    path_names: {
  #                      sign_in: 'login',
  #                      sign_out: 'logout',
  #                      password: 'secret',
  #                      confirmation: 'verification',
  #                      unlock: 'unblock',
  #                      registration: 'register',
  #                      sign_up: 'cmon_let_me_in'
  #                    }

  root 'home#index'
  resources :food, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :show, :create, :destroy]
end
