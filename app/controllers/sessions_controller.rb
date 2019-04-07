# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.authenticate(params[:email], params[:password])

    if !@user.errors.key?(:invalid)
      sign_in(@user)
      params[:remember_me] == 'true' ? remember(@user) : forget(@user)
      redirect_to(root_url)
    else
      @errors = @user.errors
      render 'new', status: 401
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_url
  end
end
