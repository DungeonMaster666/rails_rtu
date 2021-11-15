Rails.application.routes.draw do
  resources :velprods
  resources :nevelprods
  resources :lietotajaparametrs
  devise_for :users, controllers: { registrations: "registrations" }
  root 'lietotajaparametrs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
