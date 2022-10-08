Rails.application.routes.draw do
  # get 'reviews/new'
  devise_for :users
  root to: "pages#home"

  # ruta de Escoger un Place y hacer una reserva
  resources :places do
    resources :reservations, only: %i[new create]
    resources :reviews, only: [:new, :create]
  end
  
  # ruta  para que 1 USER pueda ver sus rervaciones
  resources :users do
    resources :reservations, only: :index
  end

  resources :reservations, only: :show
end
