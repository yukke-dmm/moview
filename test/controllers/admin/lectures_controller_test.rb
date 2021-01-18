require 'test_helper'

class Admin::LecturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_lectures_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_lectures_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_lectures_edit_url
    assert_response :success
  end

end
