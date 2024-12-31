require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_registration_path
    assert_response :success
  end

  test "should get create" do
    post registrations_path, params: { customer: { name: "Test User", email: "test@example.com", password: "password", password_confirmation: "password" } }
    assert_response :redirect 
    follow_redirect!
    assert_response :success
  end
end
