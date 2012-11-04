require "minitest_helper"

class StoriesControllerTest < MiniTest::Rails::ActionController::TestCase

	def setup
		@author = User.create!(email: "author@user.com", password: "12345")
		@performer = User.create!(email: "performer@user.com", password: "12345")
		@story = Story.create!(title: "test story", author_id: @author.id, performer_id: @performer.id)
	
		sign_in @author
	end

	test "should get index" do
		get :index
		assert_response :success
	end

	test "should get show" do

		get :show, id: @story.id
		assert_response :success
	end

	test "shouldn't change state if not performer" do 
		get :change_state, story_id: @story.id, event: "accept"
		assert_response :success
		assert flash[:error]
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should post create" do
		attrs = { title: "123", author_id: @author.id, performer_id: @performer.id }
		post :create, story: attrs
		assert_response :redirect
		assert Story.find_by_title(attrs[:title])
	end

	test "should get edit" do 
		get :edit, id: @story.id
		assert_response :success
	end

	test "should put update" do
		attrs = { title: "new title", author_id: @author.id, performer_id: @performer.id }
		put :update, id: @story.id, story: attrs
		assert_response :redirect
		assert Story.find_by_title("new title").id == @story.id
	end

	test "should delete destroy" do 
		delete :destroy, id: @story.id
		assert_response :redirect
		assert_nil Story.find_by_id(@story.id)
	end

end