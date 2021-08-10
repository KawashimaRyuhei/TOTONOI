Rails.application.routes.draw do
  get 'stores/index'
  get 'stores/show'
  get 'stores/new'
  get 'stores/edit'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
