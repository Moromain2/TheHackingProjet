require 'test_helper'

class NextWebControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get next_web_home_url
    assert_response :success
  end

end
