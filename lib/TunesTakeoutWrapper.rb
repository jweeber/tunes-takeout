require 'httparty'

module TunesTakeoutWrapper
	BASE_URL = "https://tunes-takeout-api.herokuapp.com"
	
	def self.top_suggestions
		top_array = []
		top = HTTParty.get(BASE_URL + "/v1/suggestions/top").parsed_response["suggestions"]		
		top.each do |suggestion|
			top_array << HTTParty.get(BASE_URL + "/v1/suggestions/" + "#{suggestion}")
		end
		one_result = []
		top_array.each do |result|
			one_result << result["suggestion"]
			# raise
		end
		return one_result
	end

	def self.search(term)
		data = HTTParty.get(BASE_URL + "/v1/suggestions/search?query=#{term}").parsed_response	
	end

end