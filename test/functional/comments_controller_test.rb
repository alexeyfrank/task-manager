require "minitest_helper"

class CommentsControllerTest < MiniTest::Rails::ActionController::TestCase
	def setup
		@user = User.create!(email: "test@user.com", password: "12345")
		@story = Story.create!(title: "test story", author_id: @user.id, performer_id: @user.id)
		sign_in @user
	end

	test "should post create" do
		attrs = { content: "test content", author_id: @user.id, story_id: @story.id }
		post :create, story_id: @story.id, comment: attrs
		assert_response :redirect
		assert_nil flash[:error]
		assert Comment.find_by_content("test content").author_id == @user.id
	end

end
