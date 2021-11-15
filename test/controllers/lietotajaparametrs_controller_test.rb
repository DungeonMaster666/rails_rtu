require "test_helper"

class LietotajaparametrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lietotajaparametr = lietotajaparametrs(:one)
  end

  test "should get index" do
    get lietotajaparametrs_url
    assert_response :success
  end

  test "should get new" do
    get new_lietotajaparametr_url
    assert_response :success
  end

  test "should create lietotajaparametr" do
    assert_difference('Lietotajaparametr.count') do
      post lietotajaparametrs_url, params: { lietotajaparametr: { augums: @lietotajaparametr.augums, dzimums: @lietotajaparametr.dzimums, svars: @lietotajaparametr.svars, user_id: @lietotajaparametr.user_id, vecums: @lietotajaparametr.vecums } }
    end

    assert_redirected_to lietotajaparametr_url(Lietotajaparametr.last)
  end

  test "should show lietotajaparametr" do
    get lietotajaparametr_url(@lietotajaparametr)
    assert_response :success
  end

  test "should get edit" do
    get edit_lietotajaparametr_url(@lietotajaparametr)
    assert_response :success
  end

  test "should update lietotajaparametr" do
    patch lietotajaparametr_url(@lietotajaparametr), params: { lietotajaparametr: { augums: @lietotajaparametr.augums, dzimums: @lietotajaparametr.dzimums, svars: @lietotajaparametr.svars, user_id: @lietotajaparametr.user_id, vecums: @lietotajaparametr.vecums } }
    assert_redirected_to lietotajaparametr_url(@lietotajaparametr)
  end

  test "should destroy lietotajaparametr" do
    assert_difference('Lietotajaparametr.count', -1) do
      delete lietotajaparametr_url(@lietotajaparametr)
    end

    assert_redirected_to lietotajaparametrs_url
  end
end
