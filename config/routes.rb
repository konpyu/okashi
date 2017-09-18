Rails.application.routes.draw do
  root to: 'templates#index'
  get :signin, to: 'sessions#signin'

  namespace :me do
    resource :accounts, only: [:show, :update]
  end
  devise_for :users,
    controllers: { omniauth_callbacks: "users/omniauth_callbacks" },
    skip: %i(passwords registrations)

  namespace :api do
    namespace :v1 do
      resources :items, controller: :items
    end

    match '*path', via: :get, to: 'templates#index'
  end
end
