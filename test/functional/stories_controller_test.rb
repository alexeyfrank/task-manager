require "test_helper"

class StoriesControllerTest < ActionController::TestCase

	def setup
		@author = create :author
		@performer = create :performer
		@story = create :story, author: @author, performer: @performer

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
		assert_response :redirect
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
		updated_story = Story.find_by_title("new title")
		assert_equal updated_story, @story
	end

	test "should delete destroy" do 
		delete :destroy, id: @story.id
		assert_response :redirect
		assert_nil Story.find_by_id(@story.id)
	end

end