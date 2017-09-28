require 'test_helper'

class WeightsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get weights_new_url
    assert_response :success
  end

  test "should get create" do
    get weights_create_url
    assert_response :success
  end

  test "should get edit" do
    get weights_edit_url
    assert_response :success
  end

  test "should get update" do
    get weights_update_url
    assert_response :success
  end

  test "should get destroy" do
    get weights_destroy_url
    assert_response :success
  end

end
