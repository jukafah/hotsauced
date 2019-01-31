class ReviewsController < ApplicationController
  def create
    @sauce = Sauce.find(params[:sauce_id])
    @review = @sauce.reviews.create(review_params)
    redirect_to sauce_path(@sauce)
  end

  def update
    @sauce = Sauce.find(params[:sauce_id])
    @review = @sauce.reviews.find(params[:id])
    @review.update(review_update_params)
    redirect_to sauce_path(@sauce)
  end

  def destroy
    @sauce = Sauce.find(params[:sauce_id])
    @review = @sauce.reviews.find(params[:id])
    @review.delete
    redirect_to sauce_path(@sauce)
  end

  private

  def review_params
    params.require(:review).permit(:user, :body, :rating)
  end

  def review_update_params
    params.require(:review).permit(:body)
  end
end
