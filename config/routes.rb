Rails.application.routes.draw do
  
  root "suggestions#index"

  post "/suggestions" => "suggestions#show", as: "search"

  get "/auth/:provider/callback" => "sessions#create"
  delete '/logout' => "sessions#destroy", as: 'logout'
end
