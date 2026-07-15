Rails.application.routes.draw do
  root "companies#index"

  resources :companies do
    resources :jobs do
      resources :applicants
    end
  end
end