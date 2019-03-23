# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      sign_in user
      params[:remember_me] == 'true' ? remember(user) : forget(user)
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_url
  end
end
