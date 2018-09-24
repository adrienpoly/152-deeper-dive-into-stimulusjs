Rails.application.routes.draw do
  resources :states, only: [] do
    # /states/:state_id/counties
    resources :counties, only: :index do
      resources :cities, only: :index
    end
  end

  resources :accounts
  root to: 'accounts#index'
end
