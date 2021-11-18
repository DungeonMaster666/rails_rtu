require "test_helper"

class BazesprodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bazesprod = bazesprods(:one)
  end

  test "should get index" do
    get bazesprods_url
    assert_response :success
  end

  test "should get new" do
    get new_bazesprod_url
    assert_response :success
  end

  test "should create bazesprod" do
    assert_difference('Bazesprod.count') do
      post bazesprods_url, params: { bazesprod: { nutrition1: @bazesprod.nutrition1, prodnos: @bazesprod.prodnos } }
    end

    assert_redirected_to bazesprod_url(Bazesprod.last)
  end

  test "should show bazesprod" do
    get bazesprod_url(@bazesprod)
    assert_response :success
  end

  test "should get edit" do
    get edit_bazesprod_url(@bazesprod)
    assert_response :success
  end

  test "should update bazesprod" do
    patch bazesprod_url(@bazesprod), params: { bazesprod: { nutrition1: @bazesprod.nutrition1, prodnos: @bazesprod.prodnos } }
    assert_redirected_to bazesprod_url(@bazesprod)
  end

  test "should destroy bazesprod" do
    assert_difference('Bazesprod.count', -1) do
      delete bazesprod_url(@bazesprod)
    end

    assert_redirected_to bazesprods_url
  end
end
