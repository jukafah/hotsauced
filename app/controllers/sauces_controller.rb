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

    if @sauce.save
      redirect_to @sauce
    else
      render 'new', status: 422
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

  private

  def sauce_params
    params.require(:sauce).permit(:name, :description, :pepper, :ingredients, :brand, :origin, :image)
  end
end
