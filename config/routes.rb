Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: :registrations}
  root "pages#show"

  resources :games, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
    resources :rates, only: [:create, :update, :destroy]
    resources :game_follows, only: [:create, :destroy]
  end

  resources :users, except: [:index, :new, :create] do
    resources :requests
  end

  resources :reviews do
    resources :emotitions, only: [:create, :destroy]
    resources :comments
  end

  resources :comments, only: :show do
    resources :reply_comments, except: :show
  end

  resources :genres, only: [:index, :show]
  resources :searches, only: :index

  namespace :admin do
    root "games#index"
  end
end
