require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  def test_get_index
    get :index

    assert_response :success
    assert_template 'index'
  end
end
