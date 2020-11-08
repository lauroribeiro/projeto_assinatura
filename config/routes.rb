Rails.application.routes.draw do
  resources :requests, except: [:edit] do
    resources :users, only: [:new, :create,:update]
  end
  resources :users, except: [:new,:create]
  
  # resources :articles do
  #   resources :comments, only: [:index, :new, :create]
  # end
  # resources :comments, only: [:show, :edit, :update, :destroy]
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
