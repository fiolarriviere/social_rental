Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :places do
    resources :reservations, only: %i[new create]
    resources :reviews, only: [:new, :create]
  end
  resources :reservations, only: %i[index show]
  resources :reviews, only: %i[edit update destroy]
end
