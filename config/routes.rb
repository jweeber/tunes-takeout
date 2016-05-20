Rails.application.routes.draw do
  
  root 'suggestions#index'
  post '/suggestions' => 'suggestions#show', as: 'search'

  # get '/:user_id/favorites' => 'suggestions#favorites', as: 'favorites'
  post '/suggestions/:id/favorite' => 'suggestions#favorite', as: 'favorite'

  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: 'logout'
end
