require 'test_helper'

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purchases_index_url
    assert_response :success
  end

  test "should get done" do
    get purchases_done_url
    assert_response :success
  end

end
