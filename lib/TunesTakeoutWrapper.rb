require 'httparty'

module TunesTakeoutWrapper
	BASE_URL = "https://tunes-takeout-api.herokuapp.com"
	
	# attr_reader :name, :moves, :sprites

	def self.search(term)
		@data = HTTParty.get(BASE_URL + "/v1/suggestions/search?query=#{term}&limit=20").parsed_response	
	end

	# private

	# def reject_null_sprites(sprite_hash)
	# 	sprite_hash.reject do |name, url|
	# 		url.nil?
	# 	end
	

end