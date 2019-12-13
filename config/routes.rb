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
    collection do
      get 'search'
    end
  end
  resources :payments
end
