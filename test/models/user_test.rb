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
end
