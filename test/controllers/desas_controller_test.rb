require 'test_helper'

class DesasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @desa = desas(:one)
  end

  test "should get index" do
    get desas_url
    assert_response :success
  end

  test "should get new" do
    get new_desa_url
    assert_response :success
  end

  test "should create desa" do
    assert_difference('Desa.count') do
      post desas_url, params: { desa: { name: @desa.name } }
    end

    assert_redirected_to desa_url(Desa.last)
  end

  test "should show desa" do
    get desa_url(@desa)
    assert_response :success
  end

  test "should get edit" do
    get edit_desa_url(@desa)
    assert_response :success
  end

  test "should update desa" do
    patch desa_url(@desa), params: { desa: { name: @desa.name } }
    assert_redirected_to desa_url(@desa)
  end

  test "should destroy desa" do
    assert_difference('Desa.count', -1) do
      delete desa_url(@desa)
    end

    assert_redirected_to desas_url
  end
end
