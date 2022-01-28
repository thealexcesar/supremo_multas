require "application_system_test_case"

class FinePointsTest < ApplicationSystemTestCase
  setup do
    @fine_point = fine_points(:one)
  end

  test "visiting the index" do
    visit fine_points_url
    assert_selector "h1", text: "Fine Points"
  end

  test "creating a Fine point" do
    visit fine_points_url
    click_on "New Fine Point"

    fill_in "Name", with: @fine_point.name
    fill_in "Point", with: @fine_point.point
    click_on "Create Fine point"

    assert_text "Fine point was successfully created"
    click_on "Back"
  end

  test "updating a Fine point" do
    visit fine_points_url
    click_on "Edit", match: :first

    fill_in "Name", with: @fine_point.name
    fill_in "Point", with: @fine_point.point
    click_on "Update Fine point"

    assert_text "Fine point was successfully updated"
    click_on "Back"
  end

  test "destroying a Fine point" do
    visit fine_points_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fine point was successfully destroyed"
  end
end
