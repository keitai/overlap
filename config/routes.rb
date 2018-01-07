Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root to: "therapists#index"
  end
  root to: 'therapists#index'
  devise_for :users
  resources :users
  resources :therapists
  resources :notes
  resources :appointments
end
