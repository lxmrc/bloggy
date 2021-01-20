Rails.application.routes.draw do
  get 'static_pages/welcome'
  root 'static_pages#welcome'

  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: [:show]
  resources :posts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
