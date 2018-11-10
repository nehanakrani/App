require 'test_helper'

class PictureControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get picture_new_url
    assert_response :success
  end

end
