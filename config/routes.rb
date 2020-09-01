Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  put '/users/:id', to: 'users#update', as: 'update_user'

  resources :users, only: [:show, :edit, :update]
  resources :challenges, only: [:show, :index]

  resources :groups, only: [:show, :index, :new, :create] do
      resources :users_groups, only: [:new, :create, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
