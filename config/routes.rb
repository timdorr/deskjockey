Rails.application.routes.draw do
  resource :widget

  root "widgets#show"
end
