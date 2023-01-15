require "test_helper"

class PowerStonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @power_stone = power_stones(:one)
  end

  test "should get index" do
    get power_stones_url
    assert_response :success
  end

  test "should get new" do
    get new_power_stone_url
    assert_response :success
  end

  test "should create power_stone" do
    assert_difference("PowerStone.count") do
      post power_stones_url, params: { power_stone: { name: @power_stone.name, overview: @power_stone.overview } }
    end

    assert_redirected_to power_stone_url(PowerStone.last)
  end

  test "should show power_stone" do
    get power_stone_url(@power_stone)
    assert_response :success
  end

  test "should get edit" do
    get edit_power_stone_url(@power_stone)
    assert_response :success
  end

  test "should update power_stone" do
    patch power_stone_url(@power_stone), params: { power_stone: { name: @power_stone.name, overview: @power_stone.overview } }
    assert_redirected_to power_stone_url(@power_stone)
  end

  test "should destroy power_stone" do
    assert_difference("PowerStone.count", -1) do
      delete power_stone_url(@power_stone)
    end

    assert_redirected_to power_stones_url
  end
end
