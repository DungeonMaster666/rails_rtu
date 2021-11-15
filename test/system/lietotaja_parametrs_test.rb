require "application_system_test_case"

class LietotajaParametrsTest < ApplicationSystemTestCase
  setup do
    @lietotaja_parametr = lietotaja_parametrs(:one)
  end

  test "visiting the index" do
    visit lietotaja_parametrs_url
    assert_selector "h1", text: "Lietotaja Parametrs"
  end

  test "creating a Lietotaja parametr" do
    visit lietotaja_parametrs_url
    click_on "New Lietotaja Parametr"

    fill_in "Augums", with: @lietotaja_parametr.augums
    fill_in "Dzimums", with: @lietotaja_parametr.dzimums
    fill_in "Svars", with: @lietotaja_parametr.svars
    fill_in "User", with: @lietotaja_parametr.user_id
    fill_in "Vecums", with: @lietotaja_parametr.vecums
    click_on "Create Lietotaja parametr"

    assert_text "Lietotaja parametr was successfully created"
    click_on "Back"
  end

  test "updating a Lietotaja parametr" do
    visit lietotaja_parametrs_url
    click_on "Edit", match: :first

    fill_in "Augums", with: @lietotaja_parametr.augums
    fill_in "Dzimums", with: @lietotaja_parametr.dzimums
    fill_in "Svars", with: @lietotaja_parametr.svars
    fill_in "User", with: @lietotaja_parametr.user_id
    fill_in "Vecums", with: @lietotaja_parametr.vecums
    click_on "Update Lietotaja parametr"

    assert_text "Lietotaja parametr was successfully updated"
    click_on "Back"
  end

  test "destroying a Lietotaja parametr" do
    visit lietotaja_parametrs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lietotaja parametr was successfully destroyed"
  end
end
