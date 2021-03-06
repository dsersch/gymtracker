Rails.application.routes.draw do

  root 'sessions#new'
  resources :users
  resources :sessions, only: [:new, :create]
  delete "/logout" => "sessions#destroy", as: :logout
  resources :workouts, except: [:index]
  resources :exercises, except: [:index, :edit, :update]
  resources :results, only: [:new, :create, :show, :destroy]
  resources :weights, except: [:index, :show]
end
