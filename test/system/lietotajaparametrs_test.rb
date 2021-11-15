require "application_system_test_case"

class LietotajaparametrsTest < ApplicationSystemTestCase
  setup do
    @lietotajaparametr = lietotajaparametrs(:one)
  end

  test "visiting the index" do
    visit lietotajaparametrs_url
    assert_selector "h1", text: "Lietotajaparametrs"
  end

  test "creating a Lietotajaparametr" do
    visit lietotajaparametrs_url
    click_on "New Lietotajaparametr"

    fill_in "Augums", with: @lietotajaparametr.augums
    fill_in "Dzimums", with: @lietotajaparametr.dzimums
    fill_in "Svars", with: @lietotajaparametr.svars
    fill_in "User", with: @lietotajaparametr.user_id
    fill_in "Vecums", with: @lietotajaparametr.vecums
    click_on "Create Lietotajaparametr"

    assert_text "Lietotajaparametr was successfully created"
    click_on "Back"
  end

  test "updating a Lietotajaparametr" do
    visit lietotajaparametrs_url
    click_on "Edit", match: :first

    fill_in "Augums", with: @lietotajaparametr.augums
    fill_in "Dzimums", with: @lietotajaparametr.dzimums
    fill_in "Svars", with: @lietotajaparametr.svars
    fill_in "User", with: @lietotajaparametr.user_id
    fill_in "Vecums", with: @lietotajaparametr.vecums
    click_on "Update Lietotajaparametr"

    assert_text "Lietotajaparametr was successfully updated"
    click_on "Back"
  end

  test "destroying a Lietotajaparametr" do
    visit lietotajaparametrs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lietotajaparametr was successfully destroyed"
  end
end
