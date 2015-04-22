class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
    @story.punch(request)
    location= "#{@story.location.name.split.join("+")}+washington+dc"
    @map = "https://maps.googleapis.com/maps/api/staticmap?center=#{location}&zoom=15&size=200x200&markers=color:0x009696|#{location}&key=#{ENV['my_api_key']}"
  end

  def new
    @story = current_user.stories.new
  end

  def create
    @location = Location.find_or_create_by(neighborhood_id: params[:story][:neighborhood_id], name: params[:story][:location])
    params[:story][:location_id] = @location.id
    params[:story][:title] = params[:story][:title].titleize
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
    params[:story][:title] = params[:story][:title].titleize
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

  def mark_important
    @story = Story.find(params[:story_id])
    if !current_user.importance_markers.find_by(story_id: @story.id)
      @importance_marker = ImportanceMarker.create(user_id: current_user.id, story_id: @story.id, important: true)  
    else
      @importance_marker = current_user.importance_markers.find_by(story_id: @story.id)
      @importance_marker.update(important: true)
    end
    @story.importance += 1
    @story.save
    redirect_to @story
  end

  def mark_unimportant
    @story = Story.find(params[:story_id])
    if !current_user.importance_markers.find_by(story_id: @story.id)
      @importance_marker = ImportanceMarker.create(user_id: current_user.id, story_id: @story.id, important: false)  
    else
      @importance_marker = current_user.importance_markers.find_by(story_id: @story.id)
      @importance_marker.update(important: false)
    end
    @story.importance -= 1
    @story.save
    redirect_to @story
  end

  private
  def story_params
    params.require(:story).permit(:title, :body, :category_id, :user_id, :neighborhood_id, :location_id)
  end
end