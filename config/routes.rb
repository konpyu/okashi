Rails.application.routes.draw do
  root to: 'templates#index'
  get :signin, to: 'sessions#signin'

  namespace :me do
    resource :accounts, only: [:show, :update]
  end
  # namespace :settings do
  #   resource :profile, only: [:show, :update]
  #   resource :preferences, only: [:show, :update]
  #   resource :import, only: [:show, :create]

  #   resource :export, only: [:show]
  #   namespace :exports, constraints: { format: :csv } do
  #     resources :follows, only: :index, controller: :following_accounts
  #     resources :blocks, only: :index, controller: :blocked_accounts
  #     resources :mutes, only: :index, controller: :muted_accounts
  #   end

  #   resource :two_factor_authentication, only: [:show, :create, :destroy]
  #   namespace :two_factor_authentication do
  #     resources :recovery_codes, only: [:create]
  #     resource :confirmation, only: [:new, :create]
  #   end

  #   resource :follower_domains, only: [:show, :update]

  #   resources :applications, except: [:edit] do
  #     member do
  #       post :regenerate
  #     end
  #   end

  #   resource :delete, only: [:show, :destroy]

  #   resources :sessions, only: [:destroy]
  # end


  devise_for :users,
    controllers: { omniauth_callbacks: "users/omniauth_callbacks" },
    skip: %i(passwords registrations sessions)

  namespace :api do

    # JSON / REST API
    namespace :v1 do
      resources :items, controller: :items
      # resources :statuses, only: [:create, :show, :destroy] do
      #   scope module: :statuses do
      #     resources :reblogged_by, controller: :reblogged_by_accounts, only: :index
      #     resources :favourited_by, controller: :favourited_by_accounts, only: :index
      #     resource :reblog, only: :create
      #     post :unreblog, to: 'reblogs#destroy'

      #     resource :favourite, only: :create
      #     post :unfavourite, to: 'favourites#destroy'

      #     resource :mute, only: :create
      #     post :unmute, to: 'mutes#destroy'
      #   end

      #   member do
      #     get :context
      #     get :card
      #   end
      # end
    end


    match '*path', via: :get, to: 'templates#index'
  end


end
