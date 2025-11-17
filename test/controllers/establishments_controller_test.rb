require "test_helper"

class EstablishmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get establishments_index_url
    assert_response :success
  end

  test "should get show" do
    get establishments_show_url
    assert_response :success
  end

  test "should get new" do
    get establishments_new_url
    assert_response :success
  end
end
