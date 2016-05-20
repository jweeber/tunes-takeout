require 'test_helper'
require 'TunesTakeoutWrapper'

class TunesTakeoutWrapperTest < ActiveSupport::TestCase

describe TunesTakeoutWrapper do

  it "uses v1 of the API" do
    assert_equal "https://tunes-takeout-api.herokuapp.com/v1", TunesTakeoutWrapper::BASE_URL
  end

  # describe "API" do
  #   before do
  #     results = {"id"=>"Vz0KNY-RRwADbn2k", "food_id"=>"ohana-seattle-2", "music_id"=>"0DeXBSPxuMGmgT1MSrzXe2", "music_type"=>"album"}
  #     @banana_album = Music.get_music(results)
  #   end

  #   it "can find an album name", :vcr do
  #     assert_equal "Banana Slug String Band", @banana_album.name
  #   end

  # end


end

end