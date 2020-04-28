Rails.application.routes.draw do
  devise_for :users
  # get 'albums/index'
  root "albums#index"
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :albums, only: [:index, :new, :create, :destroy, :show] do
    collection do
      get 'search'
    end
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
