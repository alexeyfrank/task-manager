require "test_helper"

class SessionsControllerTest < ActionController::TestCase
  
  def setup
  	@member = create :user # User.create(email: "test@test.com", password: "12345")
  end

  test "should get new" do
    get "new"
    assert_response :success
  end

  test "should post create" do
  	post "create", user: {
  			email: @member.email,
  			password: @member.password
		}

  	assert_response :redirect
  	assert signed_in?
  end

  test "shouldn't authenticate with invalid email or password" do
    post :create, user: {
      email:"",
      password: ""
    }

    assert_response :success
    assert flash[:error]
    assert !signed_in?
  end

  test "should destroy session" do
    sign_in @member
    delete :destroy

    assert_response :redirect
    assert !signed_in?
  end

end
