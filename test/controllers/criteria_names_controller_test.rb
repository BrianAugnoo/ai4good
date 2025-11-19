require "test_helper"

class CriteriaNamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get criteria_names_index_url
    assert_response :success
  end
end
