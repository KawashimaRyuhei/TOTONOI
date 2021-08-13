Rails.application.routes.draw do
  devise_for :users
  root to: "stores#index"
  resources :stores do
    resources :comments, only: :create
  end
end
