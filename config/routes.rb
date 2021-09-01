Rails.application.routes.draw do
  get 'inquiry/index'
  get 'inquiry/confirm'
  get 'inquiry/thanks'
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
  get   'inquiry'         => 'inquiry#index'
  post  'inquiry/confirm' => 'inquiry#confirm'
  post  'inquiry/thanks'  => 'inquiry#thanks'
end