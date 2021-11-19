require "application_system_test_case"

class EdienkartesTest < ApplicationSystemTestCase
  setup do
    @edienkarte = edienkartes(:one)
  end

  test "visiting the index" do
    visit edienkartes_url
    assert_selector "h1", text: "Edienkartes"
  end

  test "creating a Edienkarte" do
    visit edienkartes_url
    click_on "New Edienkarte"

    fill_in "Cena", with: @edienkarte.cena
    fill_in "Linktophoto", with: @edienkarte.linktophoto
    fill_in "Nutrition1", with: @edienkarte.nutrition1
    fill_in "Prodnos", with: @edienkarte.prodnos
    fill_in "Quantity", with: @edienkarte.quantity
    fill_in "Shopnos", with: @edienkarte.shopnos
    fill_in "User", with: @edienkarte.user_id
    click_on "Create Edienkarte"

    assert_text "Edienkarte was successfully created"
    click_on "Back"
  end

  test "updating a Edienkarte" do
    visit edienkartes_url
    click_on "Edit", match: :first

    fill_in "Cena", with: @edienkarte.cena
    fill_in "Linktophoto", with: @edienkarte.linktophoto
    fill_in "Nutrition1", with: @edienkarte.nutrition1
    fill_in "Prodnos", with: @edienkarte.prodnos
    fill_in "Quantity", with: @edienkarte.quantity
    fill_in "Shopnos", with: @edienkarte.shopnos
    fill_in "User", with: @edienkarte.user_id
    click_on "Update Edienkarte"

    assert_text "Edienkarte was successfully updated"
    click_on "Back"
  end

  test "destroying a Edienkarte" do
    visit edienkartes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Edienkarte was successfully destroyed"
  end
end
