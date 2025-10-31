require "test_helper"

class AgeSectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get age_sections_index_url
    assert_response :success
  end

  test "should get show" do
    get age_sections_show_url
    assert_response :success
  end
end
