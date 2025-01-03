Rails.application.routes.draw do
  # Public home page
  root "home#index"

  # User authentication
  resource :session, only: [:new, :create, :destroy]
  resources :passwords, only: [:new, :create, :edit, :update]

  # Public resources
  resources :products, only: [:index, :show] do
    collection do
      get :search
    end
  end
  resources :tags, only: [:index, :show]
  resources :product_categories, only: [:index, :show]
  resources :pages

  # Wishlist
  resources :wishlists, only: [:create, :destroy]

  # Customer routes
  resources :customers, only: [:show, :edit, :update]
  resource :customer_session, only: [:new, :create, :destroy]
  resources :registrations, only: [:new, :create]

  # Cart
  resource :cart, only: [:show] do
    post "add_item", to: "carts#add_item"
    delete "remove_item/:id", to: "carts#remove_item", as: "remove_item"
    delete "clear", to: "carts#clear", as: "clear"
  end

  # Admin namespace
  namespace :admin do
    root "products#index"
    resource :session, only: [:new, :create, :destroy]
    resources :products do
      resources :product_variations, only: [:create, :update, :destroy]
    end
    resources :product_categories
    resources :tags
    resources :pages
    resources :customers, only: [:index, :show]
    resources :variations do
      resources :variation_values, only: [:new, :create, :edit, :update, :destroy]
    end
    resources :site_settings, only: [:index] do
      collection do
        patch :update
      end
    end
  end

  # Health check
  get "up", to: "rails/health#show", as: :rails_health_check
end
