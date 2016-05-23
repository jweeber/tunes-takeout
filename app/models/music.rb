require 'rspotify'

class Music

	def self.get_music(results)
		results.map do |item| 
	 		if item["music_type"] == "artist" 
				RSpotify::Artist.find(item["music_id"])
			elsif item["music_type"] == "album" 
				RSpotify::Album.find(item["music_id"])
	 		elsif item["music_type"] == "track" 
				RSpotify::Track.find(item["music_id"])
			else 
				""
	 		end 
		end
	end

end