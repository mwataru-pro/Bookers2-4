Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :users

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
  	resource :favorite, only: [:create, :destroy]
  	resources :book_comments, only: [:create,:destroy]
  end

  resources :users, only: [:index, :show, :edit, :update]
end
