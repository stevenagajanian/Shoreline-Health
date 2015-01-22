require 'test_helper'

class PharmaciesControllerTest < ActionController::TestCase
  setup do
    @pharmacy = pharmacies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pharmacies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pharmacy" do
    assert_difference('Pharmacy.count') do
      post :create, pharmacy: { b_current: @pharmacy.b_current, medication_id: @pharmacy.medication_id, name: @pharmacy.name, user_id: @pharmacy.user_id }
    end

    assert_redirected_to pharmacy_path(assigns(:pharmacy))
  end

  test "should show pharmacy" do
    get :show, id: @pharmacy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pharmacy
    assert_response :success
  end

  test "should update pharmacy" do
    patch :update, id: @pharmacy, pharmacy: { b_current: @pharmacy.b_current, medication_id: @pharmacy.medication_id, name: @pharmacy.name, user_id: @pharmacy.user_id }
    assert_redirected_to pharmacy_path(assigns(:pharmacy))
  end

  test "should destroy pharmacy" do
    assert_difference('Pharmacy.count', -1) do
      delete :destroy, id: @pharmacy
    end

    assert_redirected_to pharmacies_path
  end
end
