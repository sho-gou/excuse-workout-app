require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post login_path, params: { email: @user.email, password: "password" }
  end

  test "should redirect to survival_logs when logged in" do
    get root_path
    # 成功(200)ではなく、リダイレクト(302)を期待する
    assert_redirected_to survival_logs_path
  end
end
