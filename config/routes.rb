Rails.application.routes.draw do
  root "home#index" # Public home page

  # User authentication
  resource :session, only: [:new, :create, :destroy]
  resources :passwords, only: [:new, :create, :edit, :update]

  # Public resources
  resources :products, only: [:index, :show]
  resources :tags, only: [:index, :show]
  resources :product_categories, only: [:index, :show]
  resources :pages

  # Wishlist
  resources :wishlists, only: [:create, :destroy]


    # Customer routes
    resources :customers, only: [:show, :edit, :update]
    resource :customer_session, only: [:new, :create, :destroy]
    resources :registrations, only: [:new, :create]

  # Admin namespace
  namespace :admin do
    root "products#index"
    resource :session, only: [:new, :create, :destroy]
    resources :products
    resources :product_categories
    resources :tags
    resources :pages
  end

  # Health check
  get "up", to: "rails/health#show", as: :rails_health_check
end
