Rails.application.routes.draw do
  resources :companies do
    resources :jobs do
      resources :applicants
    end
  end
end