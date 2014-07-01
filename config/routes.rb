Rails.application.routes.draw do
  namespace :api, constraints: { format: :json } do
    resources :articles, only: [:create, :update]
    resources :providers, only: :index do
      resources :catalogs, only: :index
    end
    get 'inventory', to: 'inventory#index'
  end
end
