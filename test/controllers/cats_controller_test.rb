require 'test_helper'

class CatsControllerTest < ActionDispatch::IntegrationTest
  test 'should get add' do
    get cats_add_url
    assert_response :success
  end

  test 'should get save' do
    get cats_save_url
    assert_response :success
  end
end
