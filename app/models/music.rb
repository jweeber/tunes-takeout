require_relative '../../lib/TunesTakeoutWrapper'
require 'rspotify'

class Music

	def self.get_music(results)
		results.map do |item| 
	 		if item["music_type"] == "artist" 
				return RSpotify::Artist.find(item["music_id"])
			elsif item["music_type"] == "album" 
				return RSpotify::Album.find(item["music_id"])
	 		elsif item["music_type"] == "track" 
				return RSpotify::Track.find(item["music_id"])
			else 
				return ""
	 		end 
		end

	end

end