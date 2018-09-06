require 'test_helper'

class HgControllerTest < ActionDispatch::IntegrationTest
  test "should get random" do
    get hg_random_url
    assert_response :success
  end

end
