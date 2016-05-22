require 'test_helper'

class FoodTest < ActiveSupport::TestCase

	describe Food do 

		describe "BusinessInfo", :vcr do
			before do
				@results = [{
					"id"=>"Vz0KQY-RRwADboFN", 
					"food_id"=>"emerald-city-fish-and-chips-seattle", 
					"music_id"=>"18nhNX9AEFPINp1txOsaJS", 
					"music_type"=>"album"
					}]

	    	@business = Food.get_food(@results)
			end

			it "can find a business on yelp using food_id", :vcr do
				assert_equal "Emerald City Fish & Chips", @business.first.name
			end


		end
	end

end