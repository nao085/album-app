Rails.application.routes.draw do
  devise_for :users
  get 'albums/index'
  root "albums#index"
  resources :users, only: [:show, :edit, :update]
end
