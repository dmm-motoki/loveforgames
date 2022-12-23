require "test_helper"

class Publec::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get :index" do
    get publec_rooms_:index_url
    assert_response :success
  end

  test "should get :show" do
    get publec_rooms_:show_url
    assert_response :success
  end
end
