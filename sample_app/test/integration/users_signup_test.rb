require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_template 'users/new'
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
                               email: "user@invalid",
                               password: "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select 'div#<error_explanation>'
    assert_select 'div.<alert alert-danger>'
    assert_select 'div#<field_with_errors>'  
    assert_not flash.any?
  end

  test "valid signup information" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      # Note the use of the post_via_redirect since the successful user creation in the users_controller
      # uses the redirect_to.
      # post_via_redirect arranges to follow the redirect of the controller after successful rendering of the file,
      # resulting in the rendering of the 'users/show' template
      post_via_redirect users_path, user: { name: "Example User",
                                            email: "user@example.com",
                                            password: "password",
                                            password_confirmation: "password" }
    end
    assert_template 'users/show'
    assert_not flash.empty?
    assert_select 'div.<alert alert-success>', "Welcome to the Sample App!"
  end

end
