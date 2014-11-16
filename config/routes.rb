Rails.application.routes.draw do
  resources :searches
  resources :tickets

  get "/widget.js", to: redirect{|| ActionController::Base.helpers.asset_path("widget.js") }

  root "searches#new"
end
