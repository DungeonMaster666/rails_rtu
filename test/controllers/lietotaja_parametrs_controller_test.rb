require "test_helper"

class LietotajaParametrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lietotaja_parametr = lietotaja_parametrs(:one)
  end

  test "should get index" do
    get lietotaja_parametrs_url
    assert_response :success
  end

  test "should get new" do
    get new_lietotaja_parametr_url
    assert_response :success
  end

  test "should create lietotaja_parametr" do
    assert_difference('LietotajaParametr.count') do
      post lietotaja_parametrs_url, params: { lietotaja_parametr: { augums: @lietotaja_parametr.augums, dzimums: @lietotaja_parametr.dzimums, svars: @lietotaja_parametr.svars, user_id: @lietotaja_parametr.user_id, vecums: @lietotaja_parametr.vecums } }
    end

    assert_redirected_to lietotaja_parametr_url(LietotajaParametr.last)
  end

  test "should show lietotaja_parametr" do
    get lietotaja_parametr_url(@lietotaja_parametr)
    assert_response :success
  end

  test "should get edit" do
    get edit_lietotaja_parametr_url(@lietotaja_parametr)
    assert_response :success
  end

  test "should update lietotaja_parametr" do
    patch lietotaja_parametr_url(@lietotaja_parametr), params: { lietotaja_parametr: { augums: @lietotaja_parametr.augums, dzimums: @lietotaja_parametr.dzimums, svars: @lietotaja_parametr.svars, user_id: @lietotaja_parametr.user_id, vecums: @lietotaja_parametr.vecums } }
    assert_redirected_to lietotaja_parametr_url(@lietotaja_parametr)
  end

  test "should destroy lietotaja_parametr" do
    assert_difference('LietotajaParametr.count', -1) do
      delete lietotaja_parametr_url(@lietotaja_parametr)
    end

    assert_redirected_to lietotaja_parametrs_url
  end
end
