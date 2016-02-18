require 'test_helper'

class ProductosControllerTest < ActionController::TestCase
  setup do
    @producto = productos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should show producto" do
    get :show, id: @producto
    assert_response :success
  end

end
