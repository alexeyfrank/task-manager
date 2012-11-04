class StoriesController < ApplicationController

  before_filter :authenticate_user

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def change_state
    @story = Story.find(params[:story_id])
    if @story.performer_id == current_user.id
      @story.fire_state_event(params[:event])
      @story.save
      redirect_to story_path(@story)
    else
      flash[:error] = "This is not your task!"
      render :show 
    end
  end

  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(params[:story])

    if @story.save
      redirect_to @story, notice: 'Story was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @story = Story.find(params[:id])

    if @story.update_attributes(params[:story])
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    redirect_to stories_url
  end
end