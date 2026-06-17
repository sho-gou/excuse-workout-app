ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # fixturesを有効にする
    fixtures :all

    # Sorceryのテストヘルパーを読み込む
    include Sorcery::TestHelpers::Rails::Integration
  end
end
