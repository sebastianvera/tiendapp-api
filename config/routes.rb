Rails.application.routes.draw do
  namespace :v1, constraints: { subdomain: 'api', format: :json } do
    resources :articles
  end
end
