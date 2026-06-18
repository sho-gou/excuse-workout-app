require "test_helper"

class SurvivalLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post login_path, params: { email: @user.email, password: "password" }
  end

  test "should get index" do
    get survival_logs_path
    assert_response :success
  end

  test "should get create" do
    # パラメータに status と reported_on を含める必要があります
    # (コントローラーのロジックでこれらが必要なため)
    assert_difference("SurvivalLog.count", 1) do
      post survival_logs_path, params: {
        survival_log: {
          report_status: 1,
          reported_on: Date.today
        }
      }
    end

    # 修正箇所: カレンダーページへリダイレクトされることを期待する
    assert_redirected_to calendar_survival_logs_path
  end
end
