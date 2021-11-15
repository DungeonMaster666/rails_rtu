require "application_system_test_case"

class VelprodsTest < ApplicationSystemTestCase
  setup do
    @velprod = velprods(:one)
  end

  test "visiting the index" do
    visit velprods_url
    assert_selector "h1", text: "Velprods"
  end

  test "creating a Velprod" do
    visit velprods_url
    click_on "New Velprod"

    fill_in "Nutrition1", with: @velprod.nutrition1
    fill_in "Prod nos", with: @velprod.prod_nos
    fill_in "User", with: @velprod.user_id
    click_on "Create Velprod"

    assert_text "Velprod was successfully created"
    click_on "Back"
  end

  test "updating a Velprod" do
    visit velprods_url
    click_on "Edit", match: :first

    fill_in "Nutrition1", with: @velprod.nutrition1
    fill_in "Prod nos", with: @velprod.prod_nos
    fill_in "User", with: @velprod.user_id
    click_on "Update Velprod"

    assert_text "Velprod was successfully updated"
    click_on "Back"
  end

  test "destroying a Velprod" do
    visit velprods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Velprod was successfully destroyed"
  end
end
