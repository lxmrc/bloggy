Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/welcome'
  root 'static_pages#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
