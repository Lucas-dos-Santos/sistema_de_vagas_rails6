require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'
  # get '/vaga/:slug', action: :public_position, controller: :positions, as: :public_position
  get '/vaga/:slug', to: "positions#public_position", as: :public_position
  
  resources :applicants, only: [:new, :create]
  resources :positions do
    resources :applicants, only: [:index]
  end
  resources :companies, only: [:new, :edit, :update, :create]
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
end
