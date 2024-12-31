require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one) #It assigns a customer fixture (from test/fixtures/customers.yml) to the @customer instance variable.
    login_as (@customer)
  end

  test "should get show" do
    get customer_path(@customer) #The get method simulates a GET request to the customer_path for the customer fixture (@customer).
    assert_response :success # Ensures the response is 200 (success).
    assert_select "h1", "Welcome, #{@customer.name}!" # Update to match the actual output
  end

  test "should get edit" do
    get edit_customer_path(@customer) # Simulates a GET request to the edit customer path.
    assert_response :success # Ensures the response is 200 (success).
    assert_select "form input[name='customer[name]']" # Checks for the presence of the name input field in the edit form.
  end

  # test "should update customer" do
  #   patch customer_path(@customer), params: {
  #     customer: {
  #       name: "Updated Name",
  #       password: "newpassword",
  #       password_confirmation: "newpassword",
  #       current_password: "test_password" # Include the current password
  #     }
  #   }
  #   assert_redirected_to customer_path(@customer) # Confirm redirect to show action.
  #   follow_redirect! # Follow the redirect.
  #   assert_match "Updated Name", response.body # Confirm the updated name is displayed.
  # end
  

  private

  # Helper method to simulate customer login.
  def login_as(customer)
    post customer_session_path, params: { email: customer.email, password: "test_password" }
  end
  
end
