require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_difference 'User.count' do
    post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    assert_template 'users/show'
    follow_redirect!
    assert_not flash.FILL_IN
    assert is_logged_in?
  end
end
