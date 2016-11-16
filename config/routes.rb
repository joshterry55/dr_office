Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  get '/about', to: 'static_pages#about', as: 'about'
  get '/contact', to: 'static_pages#contact', as: 'contact'

  resources :doctors
  resources :patients
  resources :appointments, only: [:new, :create, :destroy]
end
