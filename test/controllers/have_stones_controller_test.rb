require "test_helper"

class HaveStonesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get have_stones_create_url
    assert_response :success
  end

  test "should get destroy" do
    get have_stones_destroy_url
    assert_response :success
  end
end
