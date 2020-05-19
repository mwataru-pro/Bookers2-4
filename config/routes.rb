Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :users

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
  	resource :favorite, only: [:create, :destroy]
  	resource :book_comments, only: [:create,:destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    member do
     get :follows, :followers
    end
  end

  resources :relationships, only: [:create,:destroy]
end
