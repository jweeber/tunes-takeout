require_relative '../../lib/TunesTakeoutWrapper'

class SuggestionsController < ApplicationController
	# before_action :require_login, only: [:show]

	def index
		results = TunesTakeoutWrapper.top_suggestions
		@music = Music.get_music(results)
		@food = Food.get_food(results)
		@results = results
	end

	def show
		results = TunesTakeoutWrapper.search(params[:term])["suggestions"]
		@music = Music.get_music(results)
		@food = Food.get_food(results)
	end

	def favorites

	end

	def favorite
		status_code = TunesTakeoutWrapper.add_favorite(current_user.uid, params[:id])
		
		if status_code == 201
			@favorited = true
		end
		redirect_to root_path
	end

	def unfavorite
		status_code = TunesTakeoutWrapper.delete_favorite(current_user.uid, params[:id])
		if status_code == 201
			@unfavorited = true
		end
		redirect_to root_path
	end

end
