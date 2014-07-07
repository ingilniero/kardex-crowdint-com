KardexCrowdintCom::Application.routes.draw do
  root "home#index"

  devise_scope :user do
    get 'google_apps_sign_in',
        to: "crowdint_auth/omniauth_callbacks#google_apps_sign_in"
  end

  devise_for :users,
      controllers: { omniauth_callbacks: 'crowdint_auth/omniauth_callbacks' }

  resources :users, except: [:new, :create, :destroy, :index]
  resources :nominee_users, only: [:new, :create]
  resources :nominee_lists, only: [:index, :show]
  resources :propose_badges, only: [:new, :create]
  resources :badges, only: :index

  mount BadgesEngine::Engine, at: '/admin'

  namespace :admin do
    root "main#index"
    resource :users do 
      get :index
    end

    resources :nominee_lists, only: [:create, :new]
  end
end
