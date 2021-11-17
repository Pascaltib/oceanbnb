Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile'

  resources :yachts, only: [:index, :show] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [] do
    member do
      patch :accept
      patch :reject
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
