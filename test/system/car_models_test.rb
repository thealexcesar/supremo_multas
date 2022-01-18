require "application_system_test_case"

class CarModelsTest < ApplicationSystemTestCase
  setup do
    @car_model = car_models(:one)
  end

  test "visiting the index" do
    visit car_models_url
    assert_selector "h1", text: "Car Models"
  end

  test "creating a Car model" do
    visit car_models_url
    click_on "New Car Model"

    fill_in "Car brand", with: @car_model.car_brand_id
    fill_in "Car type", with: @car_model.car_type_id
    fill_in "Name", with: @car_model.name
    click_on "Create Car model"

    assert_text "Car model was successfully created"
    click_on "Back"
  end

  test "updating a Car model" do
    visit car_models_url
    click_on "Edit", match: :first

    fill_in "Car brand", with: @car_model.car_brand_id
    fill_in "Car type", with: @car_model.car_type_id
    fill_in "Name", with: @car_model.name
    click_on "Update Car model"

    assert_text "Car model was successfully updated"
    click_on "Back"
  end

  test "destroying a Car model" do
    visit car_models_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Car model was successfully destroyed"
  end
end
