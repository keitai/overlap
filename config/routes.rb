Rails.application.routes.draw do
  resources :videos
  namespace :admin do
    resources :users
    root to: "videos#index"
  end
  devise_for :users
  resources :users
  resources :therapists
  resources :notes
  resources :goals
  resources :clients
  resources :appointment_skills
  resources :skills
  resources :sections
  resources :appointments
  authenticated :user do
    root to: 'videos#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
end
