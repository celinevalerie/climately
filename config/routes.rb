Rails.application.routes.draw do
  devise_for :users, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' },
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :profiles, only: [:show, :edit, :update]

  resources :challenges, only: [:show, :index] do
    resources :groups, only: [:new, :create]
  end

  resources :groups, only: [:show, :index] do
    member do
      post "completed"
    end
    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
    resources :users_groups, only: [:new, :create, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
