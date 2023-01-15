require "application_system_test_case"

class PowerStonesTest < ApplicationSystemTestCase
  setup do
    @power_stone = power_stones(:one)
  end

  test "visiting the index" do
    visit power_stones_url
    assert_selector "h1", text: "Power stones"
  end

  test "should create power stone" do
    visit power_stones_url
    click_on "New power stone"

    fill_in "Name", with: @power_stone.name
    fill_in "Overview", with: @power_stone.overview
    click_on "Create Power stone"

    assert_text "Power stone was successfully created"
    click_on "Back"
  end

  test "should update Power stone" do
    visit power_stone_url(@power_stone)
    click_on "Edit this power stone", match: :first

    fill_in "Name", with: @power_stone.name
    fill_in "Overview", with: @power_stone.overview
    click_on "Update Power stone"

    assert_text "Power stone was successfully updated"
    click_on "Back"
  end

  test "should destroy Power stone" do
    visit power_stone_url(@power_stone)
    click_on "Destroy this power stone", match: :first

    assert_text "Power stone was successfully destroyed"
  end
end
