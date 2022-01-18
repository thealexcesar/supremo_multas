require 'test_helper'

class CarTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car_type = car_types(:one)
  end

  test "should get index" do
    get car_types_url
    assert_response :success
  end

  test "should get new" do
    get new_car_type_url
    assert_response :success
  end

  test "should create car_type" do
    assert_difference('CarType.count') do
      post car_types_url, params: { car_type: { name: @car_type.name } }
    end

    assert_redirected_to car_type_url(CarType.last)
  end

  test "should show car_type" do
    get car_type_url(@car_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_type_url(@car_type)
    assert_response :success
  end

  test "should update car_type" do
    patch car_type_url(@car_type), params: { car_type: { name: @car_type.name } }
    assert_redirected_to car_type_url(@car_type)
  end

  test "should destroy car_type" do
    assert_difference('CarType.count', -1) do
      delete car_type_url(@car_type)
    end

    assert_redirected_to car_types_url
  end
end
