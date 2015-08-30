Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    resources :comments, only: [:create, :new, :destroy] do
      get :upvote, :downvote
    end
    get :upvote, :downvote
  end
  resources :tags, only: :show, param: :tag do
    member do
      get :subscribe, :unsubscribe
    end
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    registrations: 'users'
  }

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

 end

