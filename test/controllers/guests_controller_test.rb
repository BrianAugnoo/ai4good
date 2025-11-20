require "test_helper"

class GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guests_index_url
    assert_response :success
  end

  test "should get edit" do
    get guests_edit_url
    assert_response :success
  end
end
