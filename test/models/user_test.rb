require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "validations: uid can't be blank" do
    user = User.new

    assert_not user.valid?
    assert user.errors.keys.include?(:uid), "uid is not in the errors hash"
  end

  test "validations: provider can't be blank" do
    user = User.new

    assert_not user.valid?
    assert user.errors.keys.include?(:provider), "provider is not in the errors hash"
  end

  def setup
    @known = {
      "provider" => "spotify",
      "uid" => "known_user",
      "info" =>  
        { "name" => "known user" , "images" => ["url" => "http://cats.com"]} 
    }

    @unknown = { 
      "provider" => "spotify",
      "uid" => "unknown_user",
      "info" =>
        { "id" => "unknown_user", "name" => "unknown user" , "images" => ["url" => "http://cats.com"]}
      }

    @unknown_with_uid = { 
      "provider" => "spotify",
      "uid" => "unknown_user_id",
      "info" =>
        { "id" => "unknown_user_id", "name" => "unknown user id" , "images" => ["url" => "http://cats.com"]}
      }
  end

  test "can find an existing user given an oauth spotify hash" do
    assert_equal users(:known_user), User.find_or_create_from_omniauth(@known)
  end

  test "can make new user given oauth spotify hash of unknown user" do
    assert_difference 'User.count', 1 do
      @user = User.find_or_create_from_omniauth @unknown
    end
  end

  test "uses oauth data to set user name, provider, uid for new users" do
    user = User.find_or_create_from_omniauth @unknown

    assert_equal @unknown['info']['name'], user.name
    assert_equal @unknown['provider'], user.provider
    assert_equal @unknown['uid'], user.uid
  end

  test "prefers a top-level uid over a nested id when creating an oauth user" do
    user = User.find_or_create_from_omniauth @unknown_with_uid
    assert_equal @unknown_with_uid['uid'], user.uid
  end

end
