require 'test_helper'

class UserConnectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_connections_create_url
    assert_response :success
  end

end
