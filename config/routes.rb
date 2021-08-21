Rails.application.routes.draw do
  devise_for :users
  root to: "stores#index"
  resources :stores do
    resources :goods, only: :create
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :goods, only: :destroy
end
