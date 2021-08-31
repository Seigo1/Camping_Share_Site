require 'test_helper'

class User::BookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_bookmarks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_bookmarks_destroy_url
    assert_response :success
  end

end
