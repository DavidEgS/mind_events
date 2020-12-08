Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'
  get 'pages/privacy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events do
    resources :event_users, only: [:new, :create]
    get 'pages/register'
  end

  resources :reports, only: [:show]

  resources :event_users, only: [:update, :destroy]

  resources :venues
end
