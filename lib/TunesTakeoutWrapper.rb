require 'httparty'

class TunesTakeoutWrapper
	BASE_URL = "https://tunes-takeout-api.herokuapp.com/v1"

	def self.get_suggestion(suggestion_id)
		HTTParty.get(BASE_URL + "/suggestions/" + "#{suggestion_id}").parsed_response["suggestion"]
	end
	
	def self.top_suggestions
		# request API to give suggestion ids
		data = HTTParty.get(BASE_URL + "/suggestions/top").parsed_response["suggestions"]
		# loop through ids, request suggestion data - music id, food id, music type	
		suggestion_hashes = []
		data.each do |suggestion_id|
			suggestion_hashes << self.get_suggestion(suggestion_id)
		end
		return suggestion_hashes
	end

	def self.search(term)
		data = HTTParty.get(BASE_URL + "/suggestions/search?query=#{term}").parsed_response["suggestions"]
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

	def self.get_favorites(uid)
		favorite_list = HTTParty.get(BASE_URL + "/users/#{uid}/favorites").parsed_response["suggestions"]	
		suggestion_hashes = []
		favorite_list.each do |suggestion_id|
			suggestion_hashes << self.get_suggestion(suggestion_id)
		end
		return suggestion_hashes
	end

end