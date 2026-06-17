require "test_helper"

class SurvivalLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    # ここでセッションを確立
    post login_path, params: { email: @user.email, password: "password" }
  end

  test "should get index" do
    get survival_logs_path
    assert_response :success
  end

  test "should get create" do
    # 適切なパラメータを指定する必要があります
    # ここは実際の SurvivalLog のカラムに合わせて修正してください
    assert_difference("SurvivalLog.count", 1) do
      post survival_logs_path, params: { survival_log: { comment: "Test log" } }
    end
    assert_redirected_to survival_logs_path # 作成後に一覧へリダイレクトされる想定
  end
end
