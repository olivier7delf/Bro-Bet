Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # index will be handle by user ?
  resources :bet_participations, only: [:index]
  resources :tournament_participations, only: [:index]

  resources :bets, only: [:show] do
    resources :bet_participations, only: [:create]
  end


  namespace :my do
    resources :bets, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :tournaments, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resources :users, only: [:show]

  resources :tournaments, only: [:show]



  # resources :bets, only: [:show, :new, :create, :edit, :update, :destroy]
  # resources :tournaments, only: [:show, :new, :create, :edit, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
