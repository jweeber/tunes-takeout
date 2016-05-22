require 'test_helper'
require "TunesTakeoutWrapper"

class TunesTakeoutWrapperTest < ActiveSupport::TestCase

  describe TunesTakeoutWrapper do

    it "uses v1 of the API" do
      assert_equal "https://tunes-takeout-api.herokuapp.com/v1", TunesTakeoutWrapper::BASE_URL
    end

    describe "API", :vcr do
      before do
        @suggestion_id = TunesTakeoutWrapper.get_suggestion("Vz0KO4-RRwADbn9t")
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

      it "can return suggestions that include the search term", :vcr do
        assert true, @search.include?("honey")
      end

      it "can add a favorite for a user", :vcr do
        TunesTakeoutWrapper.add_favorite("testuser1", "Vz0KO4-RRwADbn9f")
        favorites = TunesTakeoutWrapper.user_favorites("testuser1")

        assert true, favorites.include?("Vz0KO4-RRwADbn9f")
      end

      it "can remove a favorite for a user", :vcr do
        TunesTakeoutWrapper.add_favorite("testuser2", "Vz0KO4-RRwADbn9c")
        first_favorites = TunesTakeoutWrapper.user_favorites("testuser2").count
        TunesTakeoutWrapper.delete_favorite("testuser2", "Vz0KO4-RRwADbn9c")
        second_favorites = TunesTakeoutWrapper.user_favorites("testuser2").count

        assert_equal second_favorites, (first_favorites - 1)
      end
      
    end
  end
end