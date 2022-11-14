require "test_helper"

class Public::RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_requests_create_url
    assert_response :success
  end
end
