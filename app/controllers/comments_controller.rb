# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @sauce = Sauce.find(params[:sauce_id])
    @comment = @sauce.comments.create(comment_params)
    redirect_to sauce_path(@sauce)
  end

  def update
    @sauce = Sauce.find(params[:sauce_id])
    @comment = @sauce.comments.find(params[:id])
    @comment.update(comment_update_params)
    redirect_to sauce_path(@sauce)
  end

  def destroy
    @sauce = Sauce.find(params[:sauce_id])
    @comment = @sauce.comments.find(params[:id])
    @comment.delete
    redirect_to sauce_path(@sauce)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def comment_update_params
    params.require(:comment).permit(:body)
  end
end
