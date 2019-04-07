# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      format.html
      format.js
      if @user.save
        sign_in(@user)
        redirect_to root_path
      else
        @errors = @user.errors
        render 'errors/validation_errors.js.erb', status: 422
      end
    end
  end

  def validate
    user = User.new(user_params)
    format_validation(user, user_params)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
