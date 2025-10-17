require "test_helper"

class MenuControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get menu_admin_url
    assert_response :success
  end

  test "should get examiner" do
    get menu_examiner_url
    assert_response :success
  end
end
