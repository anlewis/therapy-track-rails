Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:index]
    end
  end
end