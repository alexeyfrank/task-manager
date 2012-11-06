require "test_helper"

class CommentsControllerTest < ActionController::TestCase
	def setup
		@story = create :story
		@current_user = create :current_user
		sign_in @current_user
	end

	test "should post create" do
		attrs = { content: "test content", author_id: @current_user.id, story_id: @story.id }
		post :create, story_id: @story.id, comment: attrs
		assert_response :redirect
		assert_nil flash[:error]
		assert_equal Comment.find_by_content("test content").author, @current_user
	end

end
