# frozen_string_literal: true

class SaucesController < ApplicationController
  def index
    @sauces = if params[:q]
                @q.result
              else
                Sauce.all
              end
  end

  def show
    @sauce = Sauce.find(params[:id])
  end

  def new
    @sauce = Sauce.new
  end

  def edit
    @sauce = Sauce.find(params[:id])
  end

  def create
    @sauce = Sauce.new(sauce_params)

    respond_to do |format|
      format.html
      format.js
      if @sauce.save
        redirect_to @sauce
      else
        @errors = @sauce.errors
        render 'errors/validation_errors.js.erb', status: 422
      end
    end
  end

  def update
    @sauce = Sauce.find(params[:id])

    if @sauce.update(sauce_params)
      redirect_to @sauce
    else
      render 'edit', status: 422
    end
  end

  def destroy
    @sauce = Sauce.find(params[:id])

    @sauce.destroy

    redirect_to sauces_path
  end

  def validate
    sauce = Sauce.new(sauce_params)
    format_validation(sauce, sauce_params)
  end

  private

  def sauce_params
    params.require(:sauce).permit(:name, :description, :pepper, :ingredients, :brand, :origin, :image)
  end
end
