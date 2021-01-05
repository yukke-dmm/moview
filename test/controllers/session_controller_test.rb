require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  # test "should get new" do
  #   get session_new_url
  #   assert_response :success
  # end

  test "should get new" do
  	get login_path
  	assert_response :success
  end

end
