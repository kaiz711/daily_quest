require 'test_helper'

class PhotocompleteControllerTest < ActionController::TestCase
  test "should get success" do
    get :success
    assert_response :success
  end

  test "should get fail" do
    get :fail
    assert_response :success
  end

end
