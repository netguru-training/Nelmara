Rails.application.routes.draw do

  root 'posts#index'

  resources :posts do
    resources :comments, only: [:create, :new, :destroy]
    get :upvote, :downvote
  end

  devise_for :users
end

