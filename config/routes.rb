Rails.application.routes.draw do
  resources :searches, only: [:new]
  resources :tickets

  match "/searches", to: "searches#create", via: [:get, :post]

  get "/widget.js", to: redirect{|| ActionController::Base.helpers.asset_path("widget.js") }

  root "searches#new"
end
