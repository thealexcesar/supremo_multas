require 'test_helper'

class CarModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car_model = car_models(:one)
  end

  test "should get index" do
    get car_models_url
    assert_response :success
  end

  test "should get new" do
    get new_car_model_url
    assert_response :success
  end

  test "should create car_model" do
    assert_difference('CarModel.count') do
      post car_models_url, params: { car_model: { car_brand_id: @car_model.car_brand_id, car_type_id: @car_model.car_type_id, name: @car_model.name } }
    end

    assert_redirected_to car_model_url(CarModel.last)
  end

  test "should show car_model" do
    get car_model_url(@car_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_model_url(@car_model)
    assert_response :success
  end

  test "should update car_model" do
    patch car_model_url(@car_model), params: { car_model: { car_brand_id: @car_model.car_brand_id, car_type_id: @car_model.car_type_id, name: @car_model.name } }
    assert_redirected_to car_model_url(@car_model)
  end

  test "should destroy car_model" do
    assert_difference('CarModel.count', -1) do
      delete car_model_url(@car_model)
    end

    assert_redirected_to car_models_url
  end
end
