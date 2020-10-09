Rails.application.routes.draw do
  root 'events#index'

  devise_for :users
  # get 'login/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :events do
    resources :sponsors
    resources :attendees
  end
end
