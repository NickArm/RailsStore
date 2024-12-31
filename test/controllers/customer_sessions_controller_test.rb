require "test_helper"

class CustomerSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_customer_session_path # Correct route helper
    assert_response :success
  end

  test "should create session" do
    post customer_session_path, params: { email: "test_customer@example.com", password: "password" }
    assert_redirected_to customer_path(customers(:three)) # Redirect to the customer's show page.
  end

  test "should destroy session" do
    delete customer_session_path # Simulate logout
    assert_redirected_to root_path # Assuming logout redirects to root
  end
end
