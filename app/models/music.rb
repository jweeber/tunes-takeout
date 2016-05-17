require 'httparty'

class Music

	BASE_URL = "https://tunes-takeout-api.herokuapp.com/v1/"
	
	# attr_reader :name, :moves, :sprites

	def initialize(data)
		# @name = data["name"]
		# @moves = data["moves"]
		# @sprites = reject_null_sprites(data["sprites"])
	end

	def self.find(id)
		data = HTTParty.get(BASE_URL + "suggestions/search/#{id}").parsed_response
		self.new(data)
	end

	# private

	# def reject_null_sprites(sprite_hash)
	# 	sprite_hash.reject do |name, url|
	# 		url.nil?
	# 	end
	
end
