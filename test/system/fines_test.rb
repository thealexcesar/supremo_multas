require "application_system_test_case"

class FinesTest < ApplicationSystemTestCase
  setup do
    @fine = fines(:one)
  end

  test "visiting the index" do
    visit fines_url
    assert_selector "h1", text: "Fines"
  end

  test "creating a Fine" do
    visit fines_url
    click_on "New Fine"

    fill_in "Branch", with: @fine.branch_id
    fill_in "Fine date", with: @fine.fine_date
    fill_in "Fine number", with: @fine.fine_number
    fill_in "Fine status", with: @fine.fine_status
    fill_in "User", with: @fine.user_id
    click_on "Create Fine"

    assert_text "Fine was successfully created"
    click_on "Back"
  end

  test "updating a Fine" do
    visit fines_url
    click_on "Edit", match: :first

    fill_in "Branch", with: @fine.branch_id
    fill_in "Fine date", with: @fine.fine_date
    fill_in "Fine number", with: @fine.fine_number
    fill_in "Fine status", with: @fine.fine_status
    fill_in "User", with: @fine.user_id
    click_on "Update Fine"

    assert_text "Fine was successfully updated"
    click_on "Back"
  end

  test "destroying a Fine" do
    visit fines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fine was successfully destroyed"
  end
end
