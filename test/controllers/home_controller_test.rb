require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get case" do
    get :case
    assert_response :success
  end

  test "should get preview" do
    get :preview
    assert_response :success
  end

  test "should get templates" do
    get :templates
    assert_response :success
  end

  test "should get template" do
    get :template
    assert_response :success
  end

  test "should get blog" do
    get :blog
    assert_response :success
  end

  test "should get post" do
    get :post
    assert_response :success
  end

  test "should get pricing" do
    get :pricing
    assert_response :success
  end

end
