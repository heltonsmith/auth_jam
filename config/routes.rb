Rails.application.routes.draw do
  get 'sessions/destroy'
  resources :sessions, only: [:new, :create, :destroy]
  root "home#index"
end
