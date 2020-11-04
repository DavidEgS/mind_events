require 'test_helper'

class VenuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get venues_index_url
    assert_response :success
  end

  test "should get show" do
    get venues_show_url
    assert_response :success
  end

  test "should get new" do
    get venues_new_url
    assert_response :success
  end

end
