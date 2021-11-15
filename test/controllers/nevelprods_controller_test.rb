require "test_helper"

class NevelprodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nevelprod = nevelprods(:one)
  end

  test "should get index" do
    get nevelprods_url
    assert_response :success
  end

  test "should get new" do
    get new_nevelprod_url
    assert_response :success
  end

  test "should create nevelprod" do
    assert_difference('Nevelprod.count') do
      post nevelprods_url, params: { nevelprod: { prod_nos: @nevelprod.prod_nos, user_id: @nevelprod.user_id } }
    end

    assert_redirected_to nevelprod_url(Nevelprod.last)
  end

  test "should show nevelprod" do
    get nevelprod_url(@nevelprod)
    assert_response :success
  end

  test "should get edit" do
    get edit_nevelprod_url(@nevelprod)
    assert_response :success
  end

  test "should update nevelprod" do
    patch nevelprod_url(@nevelprod), params: { nevelprod: { prod_nos: @nevelprod.prod_nos, user_id: @nevelprod.user_id } }
    assert_redirected_to nevelprod_url(@nevelprod)
  end

  test "should destroy nevelprod" do
    assert_difference('Nevelprod.count', -1) do
      delete nevelprod_url(@nevelprod)
    end

    assert_redirected_to nevelprods_url
  end
end
