# frozen_string_literal: true

class ReviewsController < ApplicationController
  def index
    @sauce = Sauce.find(params[:sauce_id])
    @reviews = @sauce.reviews.all
  end

  def new
    @sauce = Sauce.find(params[:sauce_id])
    @review = Review.new
  end

  def edit
    @sauce = Sauce.find(params[:sauce_id])
    @review = @sauce.reviews.find(params[:id])
  end

  def create
    @sauce = Sauce.find(params[:sauce_id])
    @review = @sauce.reviews.new(review_params)

    respond_to do |format|
      format.html
      format.js
      if @review.save
        redirect_to sauce_path(@sauce)
      else
        render 'errors.js.erb', status: 422
      end
    end
  end

  def show
    @sauce = Sauce.find(params[:sauce_id])
    @review = @sauce.reviews.find(params[:id])
  end

  def update
    @sauce = Sauce.find(params[:sauce_id])
    @review = @sauce.reviews.find(params[:id])
    if @review.update(review_update_params)
      redirect_to sauce_path(@sauce)
    else
      render 'edit', status: 422
    end
  end

  def destroy
    @sauce = Sauce.find(params[:sauce_id])
    @review = @sauce.reviews.find(params[:id])
    @review.delete
    redirect_to sauce_path(@sauce)
  end

  def validate
    sauce = Sauce.find(params[:sauce_id])
    review = sauce.reviews.new(validation_params)
    review.valid?
    field = validation_params.keys.first.try(:to_sym)
    is_valid = !review.errors.include?(field)
    error_message = review.errors[field].join(' and ').prepend("#{field.to_s} ").concat('.').capitalize
    respond_to do |format|
      format.json { render json: { field_name: field, valid: is_valid, message: error_message} }
    end
  end

  private

  def review_params
    params.require(:review).permit(:user, :headline, :body, :rating)
  end

  def review_update_params
    params.require(:review).permit(:headline, :body, :rating)
  end

  def validation_params
    params.permit(:user, :headline, :body, :rating)
  end
end
