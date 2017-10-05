Rails.application.routes.draw do
  devise_for :users
  root "pages#show"

  resources :games
end
