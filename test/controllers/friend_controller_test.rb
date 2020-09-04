require 'test_helper'

class FriendControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get friend_index_url
    assert_response :success
  end

end
