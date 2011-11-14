require 'test_helper'

class QuestMastersControllerTest < ActionController::TestCase
  setup do
    @quest_master = quest_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quest_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quest_master" do
    assert_difference('QuestMaster.count') do
      post :create, quest_master: @quest_master.attributes
    end

    assert_redirected_to quest_master_path(assigns(:quest_master))
  end

  test "should show quest_master" do
    get :show, id: @quest_master.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quest_master.to_param
    assert_response :success
  end

  test "should update quest_master" do
    put :update, id: @quest_master.to_param, quest_master: @quest_master.attributes
    assert_redirected_to quest_master_path(assigns(:quest_master))
  end

  test "should destroy quest_master" do
    assert_difference('QuestMaster.count', -1) do
      delete :destroy, id: @quest_master.to_param
    end

    assert_redirected_to quest_masters_path
  end
end
