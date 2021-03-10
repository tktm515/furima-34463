Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items
  resources :purchases, only: [:index, :create]

end
