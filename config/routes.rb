Rails.application.routes.draw do
  root 'top#index'
  get "problems_check/recommendation_for_medical_examination"
  get "problems_check/precautions"
  get 'results', to: 'results#index'
  resources :symptoms, only: %i[index]
  resources :ingredients, only: %i[index]

  namespace :admin do
    root "ingredients#index"
    resources :ingredients
    get 'login' => 'user_sessions#new'
    post 'login' => "user_sessions#create"
    get 'logout' => 'user_sessions#destroy'
    resources :symptoms
    resources :users, only: %i[index edit update show destroy]
  end

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  
end
