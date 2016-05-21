require_relative '../../lib/TunesTakeoutWrapper'

class SuggestionsController < ApplicationController
	# before_action :require_login, only: [:show]

	def index
		@results = TunesTakeoutWrapper.top_suggestions
		@music = Music.get_music(@results)
		@food = Food.get_food(@results)
		# raise
		@favorites = TunesTakeoutWrapper.get_favorites(current_user.uid)
	end

	def show
		@results = TunesTakeoutWrapper.search(params[:term])
		@music = Music.get_music(@results)
		@food = Food.get_food(@results)
		@favorites = TunesTakeoutWrapper.get_favorites(current_user.uid)
	end

	def favorites
		@favorites = TunesTakeoutWrapper.get_favorites(current_user.uid)
		@music = Music.get_music(@results)
		@food = Food.get_food(@results)
	end

	def favorite
		status_code = TunesTakeoutWrapper.add_favorite(current_user.uid, params[:id])
		redirect_to root_path
	end

	def unfavorite
		status_code = TunesTakeoutWrapper.delete_favorite(current_user.uid, params[:id])
		redirect_to root_path
	end

end
