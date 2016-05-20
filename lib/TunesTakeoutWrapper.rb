require 'httparty'

class TunesTakeoutWrapper
	BASE_URL = "https://tunes-takeout-api.herokuapp.com/v1"

	# attr_reader :music_id, :music_type, :suggestion_id, :food_id

	def initialize(data)
		@suggestion_id = data["id"]
		@music_id = data["music_id"]
		@music_type = data["music_type"]
		@food_id = data["food_id"]
	end
	
	def self.top_suggestions
		top_array = []
		data = HTTParty.get(BASE_URL + "/suggestions/top").parsed_response["suggestions"]		
		data.each do |suggestion|
			top_array << HTTParty.get(BASE_URL + "/suggestions/" + "#{suggestion}")
		end
		one_result = []
		top_array.each do |result|
			one_result << result["suggestion"]
		end
		return one_result
	end

	def self.search(term)
		data = HTTParty.get(BASE_URL + "/suggestions/search?query=#{term}").parsed_response	
		self.new(data)
	end

	def self.add_favorite(uid, suggestion_id)
		response = HTTParty.post(BASE_URL + "/users/#{uid}/favorites", 
    :body => { "suggestion": "#{suggestion_id}" }.to_json,
    :headers => {"Content-Type" => "application/json" } )	
    return response.code
	end

	def self.delete_favorite(uid, suggestion_id)
		response = HTTParty.delete(BASE_URL + "/users/#{uid}/favorites", 
    :body => { "suggestion": "#{suggestion_id}" }.to_json,
    :headers => { "Content-Type" => "application/json" } )	
    return response.code
	end

end