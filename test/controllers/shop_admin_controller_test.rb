require 'test_helper'

class ShopAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get shop_admin_home_url
    assert_response :success
  end

end
