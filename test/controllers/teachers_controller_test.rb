require 'test_helper'

class TeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get new_profile" do
    get teachers_new_profile_url
    assert_response :success
  end

  test "should get save_profile" do
    get teachers_save_profile_url
    assert_response :success
  end

end
