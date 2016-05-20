require 'test_helper'

class Music < ActiveSupport::TestCase

describe Music do

  describe "API" do
    describe "Album" do
      before do
        results = {"id"=>"Vz0KNY-RRwADbn2k", "food_id"=>"ohana-seattle-2", "music_id"=>"0DeXBSPxuMGmgT1MSrzXe2", "music_type"=>"album"}
        @banana_album = Music.get_music(results)
      end

      it "can find an album name", :vcr do
        assert_equal "Banana Slug String Band", @banana_album.name
      end
    end
  end


end

end