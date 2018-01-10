Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  devise_for :users
  resources :users
  resources :therapists
  resources :notes
  resources :goals
  resources :appointments
  authenticated :user do
    root to: 'therapists#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
end
