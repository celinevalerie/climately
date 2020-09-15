Rails.application.routes.draw do

  get 'friendship/index'
  get 'friend/index'
  devise_for :users, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' },
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', invitations: 'users/invitations' }

  root to: 'pages#home'

  resources :profiles, only: [:index, :show, :edit, :update] do
    member do
      get 'social'
    end
    resources :friendships, only: [:index, :create]
  end

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
    resources :user_groups, only: [:new, :create] do 
      member do
        post 'giveup'
        post 'accept'
        post 'decline'
      end
    end
  end
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
