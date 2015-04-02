require 'test_helper'

class SymptomsControllerTest < ActionController::TestCase
  setup do
    @symptom = symptoms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:symptoms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create symptom" do
    assert_difference('Symptom.count') do
      post :create, symptom: { date_occured: @symptom.date_occured, description: @symptom.description, user_id: @symptom.user_id }
    end

    assert_redirected_to symptom_path(assigns(:symptom))
  end

  test "should show symptom" do
    get :show, id: @symptom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @symptom
    assert_response :success
  end

  test "should update symptom" do
    patch :update, id: @symptom, symptom: { date_occured: @symptom.date_occured, description: @symptom.description, user_id: @symptom.user_id }
    assert_redirected_to symptom_path(assigns(:symptom))
  end

  test "should destroy symptom" do
    assert_difference('Symptom.count', -1) do
      delete :destroy, id: @symptom
    end

    assert_redirected_to symptoms_path
  end
end
