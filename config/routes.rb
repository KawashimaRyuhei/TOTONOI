Rails.application.routes.draw do
  devise_for :users
  root to: "stores#index"
  resources :stores do
    resources :goods, shallow: true
    resources :comments, only: :create
  end
end
