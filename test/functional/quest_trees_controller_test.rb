require 'test_helper'

class QuestTreesControllerTest < ActionController::TestCase
  setup do
    @quest_tree = quest_trees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quest_trees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quest_tree" do
    assert_difference('QuestTree.count') do
      post :create, quest_tree: @quest_tree.attributes
    end

    assert_redirected_to quest_tree_path(assigns(:quest_tree))
  end

  test "should show quest_tree" do
    get :show, id: @quest_tree.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quest_tree.to_param
    assert_response :success
  end

  test "should update quest_tree" do
    put :update, id: @quest_tree.to_param, quest_tree: @quest_tree.attributes
    assert_redirected_to quest_tree_path(assigns(:quest_tree))
  end

  test "should destroy quest_tree" do
    assert_difference('QuestTree.count', -1) do
      delete :destroy, id: @quest_tree.to_param
    end

    assert_redirected_to quest_trees_path
  end
end
