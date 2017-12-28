Rails.application.routes.draw do

  root 'surveys#index'
  get 'admin/home', to: 'admin#home'

  resources :users
  resources :surveys, only: [:index]

  namespace :admin do
    resources :surveys do
      resources :questions, only: [:index, :new, :create]
    end
    resources :questions, only: [:show, :edit, :update, :destroy]
  end

end
