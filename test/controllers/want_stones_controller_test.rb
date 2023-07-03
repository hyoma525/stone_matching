require "test_helper"

class WantStonesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get want_stones_create_url
    assert_response :success
  end

  test "should get destroy" do
    get want_stones_destroy_url
    assert_response :success
  end
end
