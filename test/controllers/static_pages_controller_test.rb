require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | ボランティア活動"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | ボランティア活動"
  end
  
  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | ボランティア活動"
  end

end
