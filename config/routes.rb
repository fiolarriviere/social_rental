Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  # ruta de Escoger un Place y hacer una reserva
  resources :places do
    resources :reservations, only: %i[new create]
  end

  # ruta  para que 1 USER pueda ver sus rervaciones
  resources :users do
    resources :reservations, only: :index
  end

  resources :reservations, only: :show
end
