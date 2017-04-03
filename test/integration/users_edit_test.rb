require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:uday)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                              email: "udaygupta708@gmail.com",
                                              password:              "panther",
                                              password_confirmation: "panther" } }

    assert_template 'users/edit'
  end
end