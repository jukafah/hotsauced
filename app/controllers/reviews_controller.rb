class ReviewsController < ApplicationController

  def new
    @sauce = Sauce.find(params[:sauce_id])
    @review = Review.new
  end

  def create
    @sauce = Sauce.find(params[:sauce_id])
    @review = @sauce.reviews.new(review_params)

    if @review.save
      redirect_to sauce_path(@sauce)
    else
      render 'new'
    end
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
    params.require(:review).permit(:user, :headline, :body, :rating)
  end

  def review_update_params
    params.require(:review).permit(:headline, :body, :rating)
  end
end
