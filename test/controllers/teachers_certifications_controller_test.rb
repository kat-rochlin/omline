require 'test_helper'

class TeachersCertificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get teachers_certifications_create_url
    assert_response :success
  end

  test "should get destroy" do
    get teachers_certifications_destroy_url
    assert_response :success
  end

end
