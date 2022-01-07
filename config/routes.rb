Rails.application.routes.draw do
  resources :edienkartes
  get 'lietotajaparametrs/activatepython'
  get 'velprods/test'
  get 'nevelprods/adding'
  get 'edienkartes/tested'
  resources :bazesprods
  resources :velprods
  resources :nevelprods
  resources :lietotajaparametrs
  devise_for :users, controllers: { registrations: "registrations" }
  root 'lietotajaparametrs#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
