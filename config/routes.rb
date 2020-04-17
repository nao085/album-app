Rails.application.routes.draw do
  devise_for :users
  # get 'albums/index'
  root "albums#index"
  resources :users, only: [:show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :albums, only: [:index, :new, :create, :destroy, :show]
end
