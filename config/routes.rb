Rails.application.routes.draw do
  
  root 'suggestions#index'

  get '/suggestions/:term' => 'suggestions#show', as: 'search'
  post '/suggestions/:term' => 'suggestions#show'

  get '/:user_id/favorites' => 'suggestions#favorites', as: 'favorites'

	post '/suggestions/:id/favorite' => 'suggestions#favorite', as: 'favorite'
	delete '/suggestions/:id/favorite' => 'suggestions#unfavorite'

  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: 'logout'
end
