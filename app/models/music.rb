require_relative '../../lib/TunesTakeoutWrapper'
require 'rspotify'

class Music

	def self.get_music(results)
		results["suggestions"].map do |item| 
	 		if item["music_type"] == "artist" 
				RSpotify::Artist.find(item["music_id"]).name
			elsif item["music_type"] == "album" 
				RSpotify::Album.find(item["music_id"]).name
	 		elsif item["music_type"] == "track" 
				RSpotify::Track.find(item["music_id"]).name 
	 		else 
				"Not found"
	 		end 
		end
	end

end