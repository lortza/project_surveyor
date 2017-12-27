Rails.application.routes.draw do

  root 'admin#home'

  resources :users

  namespace :admin do
    resources :surveys do
      resources :questions, only: [:index, :new, :create]
    end
    resources :questions, only: [:show, :edit, :update, :destroy]
  end

end
