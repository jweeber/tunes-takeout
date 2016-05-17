require_relative '../../lib/TunesTakeoutWrapper'

class SuggestionsController < ApplicationController
	def index
		
	end

	def show
		@suggestions = TunesTakeoutWrapper.search(params[:term])	
		
	end

end
