Rails.application.routes.draw do
  scope "(:locale)" do
    resources :questions

    resources :tests do
      resources :attempts
      collection do
        post :import
      end
    end

    resources :answers, only: [], param: :index do
      member do
        delete "(:id)", to: "answers#destroy", as: ""
        post "/" => "answers#create"
      end
    end
    resources :categories, only: [], param: :index do
      member do
        delete "(:id)", to: "categories#destroy", as: ""
        post "/" => "categories#create"
      end
    end

    devise_for :users
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
  get ":locale", to: "pages#home", as: :root_with_locale
  root "pages#home"
end
