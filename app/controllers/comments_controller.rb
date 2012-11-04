class CommentsController < ApplicationController

	before_filter :authenticate_user
	layout nil

	def create
		@comment = Comment.new(params[:comment])
		if @comment.save
			redirect_to story_path(@comment.story_id)
		else
			flash[:error] = "Please write a comment message!"
			redirect_to story_path(@comment.story_id)
		end
	end

end
