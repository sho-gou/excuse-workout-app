require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  # ログインヘルパーを読み込む（Deviseを使っている場合）
  include Devise::Test::IntegrationHelpers

  setup do
    # テスト用のユーザー（fixtures/users.yml にあるもの）を取得してログイン
    @user = users(:one)
    sign_in @user
  end

  test "should get top" do
    get root_path
    assert_response :success
  end
end
