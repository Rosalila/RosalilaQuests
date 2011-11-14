require 'test_helper'

class CompletedQuestsControllerTest < ActionController::TestCase
  setup do
    @completed_quest = completed_quests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:completed_quests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create completed_quest" do
    assert_difference('CompletedQuest.count') do
      post :create, completed_quest: @completed_quest.attributes
    end

    assert_redirected_to completed_quest_path(assigns(:completed_quest))
  end

  test "should show completed_quest" do
    get :show, id: @completed_quest.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @completed_quest.to_param
    assert_response :success
  end

  test "should update completed_quest" do
    put :update, id: @completed_quest.to_param, completed_quest: @completed_quest.attributes
    assert_redirected_to completed_quest_path(assigns(:completed_quest))
  end

  test "should destroy completed_quest" do
    assert_difference('CompletedQuest.count', -1) do
      delete :destroy, id: @completed_quest.to_param
    end

    assert_redirected_to completed_quests_path
  end
end
