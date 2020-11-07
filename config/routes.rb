Rails.application.routes.draw do
  resources :users
  resources :requests, only: [:index, :new, :show, :create, :destroy]
  root 'requests#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
