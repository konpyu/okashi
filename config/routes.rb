Rails.application.routes.draw do
  root to: 'templates#index'
  match '*path', via: :get, to: 'templates#index'
end