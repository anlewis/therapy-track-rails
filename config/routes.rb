Rails.application.routes.draw do
  # devise_for :users
  root to: "home#index"

  namespace :api do
    namespace :v1 do
      resources :appointments, except: [:new, :edit]
    end
  end

  devise_for :users , defaults: { format: :json }, controllers: {
    sessions: 'users/sessions'
  }
end