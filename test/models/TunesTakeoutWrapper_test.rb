require 'test_helper'
require "TunesTakeoutWrapper"

class TunesTakeoutWrapperTest < ActiveSupport::TestCase

  describe TunesTakeoutWrapper do

    it "uses v1 of the API" do
      assert_equal "https://tunes-takeout-api.herokuapp.com/v1", TunesTakeoutWrapper::BASE_URL
    end

    describe "API", :vcr do
      before do
        @suggestion_id = TunesTakeoutWrapper.get_suggestion("Vz0KO4-RRwADbn9c")
        @top_suggestions = TunesTakeoutWrapper.top_suggestions
        @search = TunesTakeoutWrapper.search("honey")
      end

      it "can retrieve a hash of suggestion info given a suggestion id", :vcr do
        assert_kind_of Hash, @suggestion_id
      end

      it "can retrieve top 20 suggestions", :vcr do
        assert_equal 20, @top_suggestions.length
      end

      it "can return 20 suggestions after user search", :vcr do
        assert_equal 20, @search.length
      end





    end


  end

end