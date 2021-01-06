require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "should get root" do
  	get root_url
  	assert_response :success
  	assert_select "title", "Home | MOVIEW"
  end


  test "should get about" do
    log_in_as(@user)
    get about_url
    assert_response :success
    assert_select "title", "About | MOVIEW"
  end

end
