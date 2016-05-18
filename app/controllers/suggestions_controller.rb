require_relative '../../lib/TunesTakeoutWrapper'

class SuggestionsController < ApplicationController
	def index
		
	end

	def show
		results = TunesTakeoutWrapper.search(params[:term])
		@music = Music.get_music(results)
	end

end
