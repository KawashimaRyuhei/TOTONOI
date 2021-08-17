Rails.application.routes.draw do
  devise_for :users
  root to: "stores#index"
  resources :stores do
    resources :goods, only: :create
    resources :comments, only: :create
  end
  resources :goods, only: :destroy
end
