require 'test_helper'

class SignupUserTest < ActionDispatch::IntegrationTest
  
  test "should signup new user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user:{ username: "pam1", email: "pam1@examaple.com", password: "password"}
    end
    assert_template 'users/show'
    assert_match "pam1", response.body
  end
  
end

