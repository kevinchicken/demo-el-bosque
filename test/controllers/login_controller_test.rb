require "test_helper"

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get auth_api" do
    get login_auth_api_url
    assert_response :success
  end
end
