require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:ross).name
    assert_response :success
    assert_template 'profiles/show'
    assert_response :success
  end

  test "should render a 404 on profile not found" do
    get :show, id: "doesnt exist"
    assert_response :not_found
  end
  
  test "that variables are assigned on successful profile viewing" do
    get :show, id: users(:ross).name
    assert assigns(:user)
    assert_not_empty assigns(:expenses)
  end
  
  test "only show the correct user's expenses" do
    get :show, id: users(:ross).name
    assigns(:expenses).each do |expense|
      assert_equal users(:ross), expense.user
    end
  end

end
