Rails.application.routes.draw do
  devise_for :users
  root "dashboard#index"
  resources :courses, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :materials, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
end
