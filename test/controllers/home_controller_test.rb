require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get signup" do
    get :signup
    assert_response :success
  end

end
