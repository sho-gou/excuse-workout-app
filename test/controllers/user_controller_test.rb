require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    # signup に対応するアクションは users#new
    get signup_path
    assert_response :success
  end

  test "should get create" do
    # create アクションは POST でアクセスするため、通常は get ではなく post
    post users_path, params: { user: { email: "test@example.com", password: "password", password_confirmation: "password" } }
    assert_response :redirect
  end
end
