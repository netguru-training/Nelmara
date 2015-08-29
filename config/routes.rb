Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    resources :comments, only: [:create, :new, :destroy] do
      get :upvote, :downvote
    end
    get :upvote, :downvote
  end
  resources :tags, only: :show, param: :tag

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

 end

