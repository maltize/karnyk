require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post :create, :message => @message.attributes
    end

    assert_redirected_to root_path
  end

  test "should show message" do
    get :show, :permalink => @message.permalink
    assert_response :success
  end

  test "should find messages" do
    get :search, :query => messages(:one).target_email
    assert_response :success
    assert assigns(:messages)
  end

end
