require 'test_helper'

class DeviseControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

end
