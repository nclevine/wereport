class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @story = Story.find(params[:story_id])
    @comment = Comment.new
  end

  def create
    @story = Story.find(params[:story_id])
    @comment = current_user.comments.new(body: params[:body], story_id: @story.id)
    if !@comment.save
      flash[:bad_comment] = "You didn't write anything!"
    end
      redirect_to @story
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @comment.story
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @story = @comment.story
    @comment.destroy
    redirect_to @story
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :story_id)
  end
end