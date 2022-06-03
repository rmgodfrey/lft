Rails.application.routes.draw do
  devise_for :users
  root to: 'offers#index'
  resources :offers, only: %i[index show new create] do
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  get 'bookings/:time', to: 'bookings#index', as: :bookings
end
