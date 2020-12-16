require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'user with a valid email should be valid' do
    user = User.new(email: "test@test.org", password_digest: "test")
    assert user.valid?
  end

  test 'user with an invalud email is not valid' do
    user = User.new(email: "hellojimbo", password_digest: 'test')
    assert_not user.valid?
  end

  test 'user with taken email should be invalid' do
    user_two = users(:one)
    user = User.new(email: user_two.email, password_digest: 'test')
    assert_not user.valid?
  end
end
