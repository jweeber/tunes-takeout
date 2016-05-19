require 'yelp'

class Food

	def self.get_food(results)
		results.map do |item| 
			Yelp.client.business(item["food_id"].parameterize).business
		end
	end
end