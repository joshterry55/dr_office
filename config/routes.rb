Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"


  resources :doctors
  resources :patients
  resources :appointments, only: [:new, :create, :destroy]
end
