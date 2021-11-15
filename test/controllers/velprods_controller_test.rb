require "test_helper"

class VelprodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @velprod = velprods(:one)
  end

  test "should get index" do
    get velprods_url
    assert_response :success
  end

  test "should get new" do
    get new_velprod_url
    assert_response :success
  end

  test "should create velprod" do
    assert_difference('Velprod.count') do
      post velprods_url, params: { velprod: { nutrition1: @velprod.nutrition1, prod_nos: @velprod.prod_nos, user_id: @velprod.user_id } }
    end

    assert_redirected_to velprod_url(Velprod.last)
  end

  test "should show velprod" do
    get velprod_url(@velprod)
    assert_response :success
  end

  test "should get edit" do
    get edit_velprod_url(@velprod)
    assert_response :success
  end

  test "should update velprod" do
    patch velprod_url(@velprod), params: { velprod: { nutrition1: @velprod.nutrition1, prod_nos: @velprod.prod_nos, user_id: @velprod.user_id } }
    assert_redirected_to velprod_url(@velprod)
  end

  test "should destroy velprod" do
    assert_difference('Velprod.count', -1) do
      delete velprod_url(@velprod)
    end

    assert_redirected_to velprods_url
  end
end
