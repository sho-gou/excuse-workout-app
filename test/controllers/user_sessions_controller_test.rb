require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should get create" do
    post login_path, params: { email: "user1@example.com", password: "password" }
    assert_response :redirect 
  end
end
