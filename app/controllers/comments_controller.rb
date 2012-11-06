class CommentsController < ApplicationController

	before_filter :authenticate_user
	layout nil

	def create
		story = Story.find(params[:story_id])
		unless story.comments.create(params[:comment])
			flash[:error] = "Please write a comment message!"
		end
		redirect_to story_path(story)
	end
end
