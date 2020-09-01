Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update]
  resources :challenges, only: [:show, :index]

  resources :groups, only: [:show, :index, :new, :create] do
      resources :users_groups, only: [:new, :create, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
