require 'httparty'

class TunesTakeoutWrapper
	BASE_URL = "https://tunes-takeout-api.herokuapp.com"

	def initialize(data)
		@suggestion_id = data["id"]
		@music_id = data["music_id"]
		@music_type = data["music_type"]
		@food_id = data["food_id"]
	end
	
	def self.top_suggestions
		top_array = []
		data = HTTParty.get(BASE_URL + "/v1/suggestions/top").parsed_response["suggestions"]		
		data.each do |suggestion|
			top_array << HTTParty.get(BASE_URL + "/v1/suggestions/" + "#{suggestion}")
		end
		one_result = []
		top_array.each do |result|
			one_result << result["suggestion"]
			# raise
		end
		return one_result
		self.new(top_array)
	end

	def self.search(term)
		data = HTTParty.get(BASE_URL + "/v1/suggestions/search?query=#{term}").parsed_response	
		self.new(data)
	end

	def self.add_favorite(uid, @suggestion_id)
    # raise
		response = HTTParty.post(BASE_URL + "/v1/suggestions/#{uid}/favorites", 
    :body => { "suggestion": "#{@suggestion_id}" }.to_json)	
    return response.code
	end

end