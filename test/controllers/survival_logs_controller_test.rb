require "test_helper"

class SurvivalLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get survival_logs_url
    assert_response :success
  end

  test "should get create" do
    get survival_logs_url
    assert_response :success
  end
end
