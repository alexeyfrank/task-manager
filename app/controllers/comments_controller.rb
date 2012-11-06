class CommentsController < ApplicationController

	before_filter :authenticate_user
	layout nil

	def create
		story = Story.find(params[:story_id])
		flash[:error] = "Please write a comment message!" unless story.comments.create(params[:comment])
		redirect_to story_path(story)
	end
end
