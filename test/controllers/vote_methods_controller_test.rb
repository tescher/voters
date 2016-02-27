require 'test_helper'

class VoteMethodsControllerTest < ActionController::TestCase
  setup do
    @vote_method = vote_methods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_methods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote_method" do
    assert_difference('VoteMethod.count') do
      post :create, vote_method: { code: @vote_method.code, name: @vote_method.name }
    end

    assert_redirected_to vote_method_path(assigns(:vote_method))
  end

  test "should show vote_method" do
    get :show, id: @vote_method
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_method
    assert_response :success
  end

  test "should update vote_method" do
    patch :update, id: @vote_method, vote_method: { code: @vote_method.code, name: @vote_method.name }
    assert_redirected_to vote_method_path(assigns(:vote_method))
  end

  test "should destroy vote_method" do
    assert_difference('VoteMethod.count', -1) do
      delete :destroy, id: @vote_method
    end

    assert_redirected_to vote_methods_path
  end
end
