require 'test_helper'

class UserRoleControllerTest < ActionController::TestCase
  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get json" do
    get :json
    assert_response :success
  end

end
