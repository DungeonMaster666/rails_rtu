require "test_helper"

class EdienkartesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @edienkarte = edienkartes(:one)
  end

  test "should get index" do
    get edienkartes_url
    assert_response :success
  end

  test "should get new" do
    get new_edienkarte_url
    assert_response :success
  end

  test "should create edienkarte" do
    assert_difference('Edienkarte.count') do
      post edienkartes_url, params: { edienkarte: { cena: @edienkarte.cena, linktophoto: @edienkarte.linktophoto, nutrition1: @edienkarte.nutrition1, prodnos: @edienkarte.prodnos, quantity: @edienkarte.quantity, shopnos: @edienkarte.shopnos, user_id: @edienkarte.user_id } }
    end

    assert_redirected_to edienkarte_url(Edienkarte.last)
  end

  test "should show edienkarte" do
    get edienkarte_url(@edienkarte)
    assert_response :success
  end

  test "should get edit" do
    get edit_edienkarte_url(@edienkarte)
    assert_response :success
  end

  test "should update edienkarte" do
    patch edienkarte_url(@edienkarte), params: { edienkarte: { cena: @edienkarte.cena, linktophoto: @edienkarte.linktophoto, nutrition1: @edienkarte.nutrition1, prodnos: @edienkarte.prodnos, quantity: @edienkarte.quantity, shopnos: @edienkarte.shopnos, user_id: @edienkarte.user_id } }
    assert_redirected_to edienkarte_url(@edienkarte)
  end

  test "should destroy edienkarte" do
    assert_difference('Edienkarte.count', -1) do
      delete edienkarte_url(@edienkarte)
    end

    assert_redirected_to edienkartes_url
  end
end
