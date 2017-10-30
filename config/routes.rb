Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: :registrations}
  root "pages#show"

  resources :games, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
    resources :rates
  end
  resources :users, except: [:index, :new, :create]
  resources :reviews do
    resources :emotitions, only: [:create, :destroy]
    resources :comments
  end
  resources :comments do
    resources :reply_comments, except: :show
  end
  resources :genres, only: [:index, :show]
end
