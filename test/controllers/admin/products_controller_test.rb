require "test_helper"

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = users(:admin) # Load the admin user from fixtures
    login_as(@admin)       # Log in the admin user
  end

  test "should get index" do
    get admin_products_url
    assert_response :success # Verify the response is successful
  end

  private

  # Helper method to simulate admin login
  def login_as(user)
    post admin_session_path, params: { email_address: user.email_address, password: "password" }
    assert_response :redirect
    follow_redirect!
    assert_equal admin_root_path, path # Ensure it redirects to the admin dashboard
  end
end
