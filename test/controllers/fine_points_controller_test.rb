require 'test_helper'

class FinePointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fine_point = fine_points(:one)
  end

  test "should get index" do
    get fine_points_url
    assert_response :success
  end

  test "should get new" do
    get new_fine_point_url
    assert_response :success
  end

  test "should create fine_point" do
    assert_difference('FinePoint.count') do
      post fine_points_url, params: { fine_point: { name: @fine_point.name, point: @fine_point.point } }
    end

    assert_redirected_to fine_point_url(FinePoint.last)
  end

  test "should show fine_point" do
    get fine_point_url(@fine_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_fine_point_url(@fine_point)
    assert_response :success
  end

  test "should update fine_point" do
    patch fine_point_url(@fine_point), params: { fine_point: { name: @fine_point.name, point: @fine_point.point } }
    assert_redirected_to fine_point_url(@fine_point)
  end

  test "should destroy fine_point" do
    assert_difference('FinePoint.count', -1) do
      delete fine_point_url(@fine_point)
    end

    assert_redirected_to fine_points_url
  end
end
