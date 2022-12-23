require "test_helper"

class Public::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get :index" do
    get public_rooms_:index_url
    assert_response :success
  end

  test "should get :show" do
    get public_rooms_:show_url
    assert_response :success
  end
end
