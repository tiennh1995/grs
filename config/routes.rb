Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  root "pages#show"

  resources :games
end
