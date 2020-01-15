Rails.application.routes.draw do
  get 'albums/index'
  root "albums#index"
end
