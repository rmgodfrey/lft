Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :offers, only: %I[index new create]
end
