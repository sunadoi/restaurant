Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "restaurants#index"
  resources :restaurants, only: [:index, :show]
  resources :reservations, only: [:index, :new, :create] do
    member do
      get 'complete'
    end
    collection do
      get 'search'
    end
  end
  resources :payments, only: [:create]
end
