require 'test_helper'

class AuthenticationControllerTest < ActionController::TestCase
  test "should get do_login" do
    get :do_login
    assert_response :success
  end

end
