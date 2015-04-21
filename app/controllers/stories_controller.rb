class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = current_user.stories.new
  end

  def create
    @location = Location.find_or_create_by(neighborhood_id: params[:story][:neighborhood_id], name: params[:story][:location])
    params[:story][:location_id] = @location.id
    @story = current_user.stories.new(story_params)
    if @story.save
      redirect_to @story 
    else
      render :new
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @location = Location.find_or_create_by(neighborhood_id: params[:story][:neighborhood_id], name: params[:story][:location])
    params[:story][:location_id] = @location.id
    @story = Story.find(params[:id])
    if @story.update(story_params)
      redirect_to @story
    else
      render :edit
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @category = @story.category
    @story.destroy
    redirect_to root_path
  end

  private
  def story_params
    params.require(:story).permit(:title, :body, :category_id, :user_id, :neighborhood_id, :location_id)
  end
end