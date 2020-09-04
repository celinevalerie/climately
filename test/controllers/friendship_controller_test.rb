require 'test_helper'

class FriendshipControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get friendship_index_url
    assert_response :success
  end

end
