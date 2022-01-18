require "application_system_test_case"

class CarTypesTest < ApplicationSystemTestCase
  setup do
    @car_type = car_types(:one)
  end

  test "visiting the index" do
    visit car_types_url
    assert_selector "h1", text: "Car Types"
  end

  test "creating a Car type" do
    visit car_types_url
    click_on "New Car Type"

    fill_in "Name", with: @car_type.name
    click_on "Create Car type"

    assert_text "Car type was successfully created"
    click_on "Back"
  end

  test "updating a Car type" do
    visit car_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @car_type.name
    click_on "Update Car type"

    assert_text "Car type was successfully updated"
    click_on "Back"
  end

  test "destroying a Car type" do
    visit car_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Car type was successfully destroyed"
  end
end
