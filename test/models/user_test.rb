require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "test", password: "test123", password_confirmation: "test123")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username required" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "username should not be too long" do
    @user.username = "a" * 51
    assert_not @user.valid?
  end

  test "username should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "username should be saved as lower-case" do
    mixed_case = "TeST"
    @user.username = mixed_case
    @user.save
    assert_equal mixed_case.downcase, @user.reload.username
  end

  test "password required" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
