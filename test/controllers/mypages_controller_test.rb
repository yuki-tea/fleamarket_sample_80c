require 'test_helper'

class MypagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get mypages_show_url
    assert_response :success
  end

end
