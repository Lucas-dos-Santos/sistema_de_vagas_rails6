Rails.application.routes.draw do
  root 'home#index'
  
  resources :applicants, only: [:index, :new, :create]
  resources :positions
  resources :companies, only: [:new, :edit, :update, :create]
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
end
