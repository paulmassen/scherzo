require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get '/dashboard'
    assert_response :success
  end

end
