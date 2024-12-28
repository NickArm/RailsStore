Rails.application.routes.draw do
  root 'home#index' # Public home page

  # User authentication
  resource :session, only: [:new, :create, :destroy]
  resources :passwords, only: [:new, :create, :edit, :update]

  # Public resources
  resources :products, only: [:index, :show]
  resources :tags, only: [:index, :show]
  resources :product_categories, only: [:index]

  # Admin namespace
  namespace :admin do
    root "products#index" # Change from sessions#new if you want this to be the main page
    resource :session, only: [:new, :create, :destroy]
    resources :products
    resources :product_categories
    resources :tags
  end  

  # Health check
  get "up", to: "rails/health#show", as: :rails_health_check
end
