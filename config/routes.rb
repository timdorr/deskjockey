Rails.application.routes.draw do
  resources :searches
  resources :tickets

  root "searches#new"
end
