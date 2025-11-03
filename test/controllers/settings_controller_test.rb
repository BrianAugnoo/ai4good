require "test_helper"

class SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get settings_admin_url
    assert_response :success
  end

  test "should get examiner" do
    get settings_examiner_url
    assert_response :success
  end
end
