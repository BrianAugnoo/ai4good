require "test_helper"

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get session_new_url
    assert_response :success
  end

  test "should get show" do
    get session_show_url
    assert_response :success
  end
end
