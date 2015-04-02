require 'test_helper'

class DoctorVisitsControllerTest < ActionController::TestCase
  setup do
    @doctor_visit = doctor_visits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doctor_visits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doctor_visit" do
    assert_difference('DoctorVisit.count') do
      post :create, doctor_visit: { album_id: @doctor_visit.album_id, doctor_id: @doctor_visit.doctor_id, location: @doctor_visit.location, notes: @doctor_visit.notes, reason: @doctor_visit.reason, user_id: @doctor_visit.user_id }
    end

    assert_redirected_to doctor_visit_path(assigns(:doctor_visit))
  end

  test "should show doctor_visit" do
    get :show, id: @doctor_visit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doctor_visit
    assert_response :success
  end

  test "should update doctor_visit" do
    patch :update, id: @doctor_visit, doctor_visit: { album_id: @doctor_visit.album_id, doctor_id: @doctor_visit.doctor_id, location: @doctor_visit.location, notes: @doctor_visit.notes, reason: @doctor_visit.reason, user_id: @doctor_visit.user_id }
    assert_redirected_to doctor_visit_path(assigns(:doctor_visit))
  end

  test "should destroy doctor_visit" do
    assert_difference('DoctorVisit.count', -1) do
      delete :destroy, id: @doctor_visit
    end

    assert_redirected_to doctor_visits_path
  end
end
