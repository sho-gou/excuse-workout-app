require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    # ルートパス（トップページ）へアクセス
    get root_path
    assert_response :success
  end
end
