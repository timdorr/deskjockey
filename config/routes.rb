Rails.application.routes.draw do
  resources :tickets

  root "tickets#new"
end
