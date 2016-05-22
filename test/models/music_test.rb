require 'test_helper'

class MusicTest < ActiveSupport::TestCase
  describe Music do 

    describe "Album Info", :vcr do
      before do
        @album_results = [{
          "id"=>"Vz0KQY-RRwADboFN", 
          "food_id"=>"emerald-city-fish-and-chips-seattle", 
          "music_id"=>"18nhNX9AEFPINp1txOsaJS", 
          "music_type"=>"album"
          }]

        @album = Music.get_music(@album_results)
      end

      it "can make call to spotify and return the name of an album", :vcr do
        assert_equal "10 Years of Cream Pie 2005 - 2015", @album.first.name
      end

      it "can make call to spotify and return album music type", :vcr do
        assert_equal "album", @album.first.type
      end
    end

    describe "Artist Info", :vcr do 
      before do
        @artist_results = [{
          "id"=>"V0HY2FElJwADzFuK", 
          "food_id"=>"baja-bistro-seattle", 
          "music_id"=>"2KVkJsyOoELcQQNzC9ajLJ", 
          "music_type"=>"artist"
        }]

        @artist = Music.get_music(@artist_results)
      end

      it "can call to spotify and return the name of an artist", :vcr do
        assert_equal "Franky & the Cheese", @artist.first.name
      end

      it "can call to spotify and return artist as music type", :vcr do
        assert_equal "artist", @artist.first.type
      end

    end

    describe "Track Info", :vcr do 
      before do
        @track_results = [{
          "id"=>"V0HY2FElJwADzFuR", 
          "food_id"=>"my-sweet-lil-cakes-seattle", 
          "music_id"=>"1RIw3X80k7wegvnIZ3bRzO", 
          "music_type"=>"track"
          }]

        @track = Music.get_music(@track_results)
      end

      it "can call to spotify and return the name of a track", :vcr do
        assert_equal "Foolish Vacuity", @track.first.name
      end

      it "can call to spotify and return track as music type", :vcr do
        assert_equal "track", @track.first.type
      end
    end

    describe "Other Music Types", :vcr do 
      before do
        @playlist_results = [{
          "id"=>"V0HY2FElJwADzFuR", 
          "food_id"=>"my-sweet-lil-cakes-seattle", 
          "music_id"=>"1RIw3X80k7wegvnIZ3bRzO", 
          "music_type"=>"playlist"
          }]

        @playlist_music = Music.get_music(@playlist_results)
      end

      it "will return empty string for other music types", :vcr do
        assert_equal "", @playlist_music.first
      end
    end
  end

end