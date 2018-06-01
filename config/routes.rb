Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1 do
      resources :appointments, except: [:new, :edit]
      resources :reports do
        resources :basic, only: [:create]
      end
    end
  end
end