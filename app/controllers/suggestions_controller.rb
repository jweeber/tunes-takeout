require_relative '../../lib/TunesTakeoutWrapper'

class SuggestionsController < ApplicationController
	# before_action :require_login, only: [:show]

	def index
		results = TunesTakeoutWrapper.top_suggestions
		@music = Music.get_music(results)
		@food = Food.get_food(results)
	end

	def show
		results = TunesTakeoutWrapper.search(params[:term])["suggestions"]
		@music = Music.get_music(results)
		@food = Food.get_food(results)
	end

	def favorites
		
	end

	def favorite
		
	end

	def unfavorite
		
	end

end
