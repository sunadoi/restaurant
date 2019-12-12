Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "restaurants#index"
  resources :restaurants
  resources :reservations do
    member do
      get 'complete'
    end
  end
  resources :payments
end
