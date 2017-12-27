Rails.application.routes.draw do

  root 'admin#home'
  namespace :admin do
    resources :surveys
  end

end
