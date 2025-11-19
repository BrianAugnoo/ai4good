require "test_helper"

class EstablishmentCriteriaControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get establishment_criteria_new_url
    assert_response :success
  end

  test "should get edit" do
    get establishment_criteria_edit_url
    assert_response :success
  end
end
