Rails.application.routes.draw do
  namespace :api, constraints: { format: :json } do
    resources :articles, only: [:create, :update, :index] do
      get 'economic', to: 'articles#economic'
    end
    resources :providers, only: :index do
      # resources :catalogs, only: :index
      get '/items', to: 'catalogs#index'
    end
    get 'inventory', to: 'inventory#index'
  end
end
