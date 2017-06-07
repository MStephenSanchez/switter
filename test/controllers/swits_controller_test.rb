require 'test_helper'

class SwitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get swits_index_url
    assert_response :success
  end

end
