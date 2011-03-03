require 'test_helper'

class SkilllevelsControllerTest < ActionController::TestCase
  setup do
    @skilllevel = skilllevels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skilllevels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skilllevel" do
    assert_difference('Skilllevel.count') do
      post :create, :skilllevel => @skilllevel.attributes
    end

    assert_redirected_to skilllevel_path(assigns(:skilllevel))
  end

  test "should show skilllevel" do
    get :show, :id => @skilllevel.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @skilllevel.to_param
    assert_response :success
  end

  test "should update skilllevel" do
    put :update, :id => @skilllevel.to_param, :skilllevel => @skilllevel.attributes
    assert_redirected_to skilllevel_path(assigns(:skilllevel))
  end

  test "should destroy skilllevel" do
    assert_difference('Skilllevel.count', -1) do
      delete :destroy, :id => @skilllevel.to_param
    end

    assert_redirected_to skilllevels_path
  end
end
