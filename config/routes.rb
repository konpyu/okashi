Rails.application.routes.draw do
  devise_for :users
  root to: 'templates#index'
  
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