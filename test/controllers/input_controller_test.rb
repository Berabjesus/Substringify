require "test_helper"

class InputControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get input_index_url
    assert_response :success
  end

  test "should get new" do
    get input_new_url
    assert_response :success
  end

  test "should get create" do
    get input_create_url
    assert_response :success
  end

  test "should get destroy" do
    get input_destroy_url
    assert_response :success
  end
end
