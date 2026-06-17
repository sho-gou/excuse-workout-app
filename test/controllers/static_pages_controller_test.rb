require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    # login_userを使わず、直接ログインリクエストを送る（これでpageエラーは消えます）
    post login_path, params: { email: @user.email, password: "password" }
  end

  test "should get top" do
    get root_path
    assert_response :success
  end
end
