require "application_system_test_case"

class BazesprodsTest < ApplicationSystemTestCase
  setup do
    @bazesprod = bazesprods(:one)
  end

  test "visiting the index" do
    visit bazesprods_url
    assert_selector "h1", text: "Bazesprods"
  end

  test "creating a Bazesprod" do
    visit bazesprods_url
    click_on "New Bazesprod"

    fill_in "Nutrition1", with: @bazesprod.nutrition1
    fill_in "Prodnos", with: @bazesprod.prodnos
    click_on "Create Bazesprod"

    assert_text "Bazesprod was successfully created"
    click_on "Back"
  end

  test "updating a Bazesprod" do
    visit bazesprods_url
    click_on "Edit", match: :first

    fill_in "Nutrition1", with: @bazesprod.nutrition1
    fill_in "Prodnos", with: @bazesprod.prodnos
    click_on "Update Bazesprod"

    assert_text "Bazesprod was successfully updated"
    click_on "Back"
  end

  test "destroying a Bazesprod" do
    visit bazesprods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bazesprod was successfully destroyed"
  end
end
