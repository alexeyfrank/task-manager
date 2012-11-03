require "minitest_helper"

class UsersControllerTest < MiniTest::Rails::ActionController::TestCase
	def setup
		@user = User.create(email: "test@test.com", password: "12345")
		sign_in @user
	end

	test "should get index" do 
		get :index 
		assert_response :success
	end

	test "should get show" do 
		get :show, id: @user.id
		assert_response :success
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should post create" do 
		attrs = { email: "asd@asd.com", password: "12345" }
		post :create, user: attrs
		assert_response :redirect
		assert User.find_by_email(attrs[:email])
	end

	test "should get edit" do 
		@editable_user = User.create(email: "q@q.com", password: "12345")
		get :edit, id: @editable_user.id
		assert_response :success
	end

	test "should put update" do 
		attrs = { email: "q@q.com", password: "12345" }
		editable_user = User.create(attrs)
		attrs = { email: "new@email.com", password: attrs[:password] }
		put :update, id: editable_user.id, user: attrs
		assert_response :redirect
		assert editable_user.id == User.find_by_email(attrs[:email]).id
	end

	test "should delete destroy" do 
		attrs = { email: "q@q.com", password: "12345" }
		editable_user = User.create(attrs)
		delete :destroy, id: editable_user.id
		assert_response :redirect
		assert_nil User.where(id: editable_user.id).first
	end


end