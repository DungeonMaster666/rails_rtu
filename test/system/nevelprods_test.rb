require "application_system_test_case"

class NevelprodsTest < ApplicationSystemTestCase
  setup do
    @nevelprod = nevelprods(:one)
  end

  test "visiting the index" do
    visit nevelprods_url
    assert_selector "h1", text: "Nevelprods"
  end

  test "creating a Nevelprod" do
    visit nevelprods_url
    click_on "New Nevelprod"

    fill_in "Prod nos", with: @nevelprod.prod_nos
    fill_in "User", with: @nevelprod.user_id
    click_on "Create Nevelprod"

    assert_text "Nevelprod was successfully created"
    click_on "Back"
  end

  test "updating a Nevelprod" do
    visit nevelprods_url
    click_on "Edit", match: :first

    fill_in "Prod nos", with: @nevelprod.prod_nos
    fill_in "User", with: @nevelprod.user_id
    click_on "Update Nevelprod"

    assert_text "Nevelprod was successfully updated"
    click_on "Back"
  end

  test "destroying a Nevelprod" do
    visit nevelprods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nevelprod was successfully destroyed"
  end
end
