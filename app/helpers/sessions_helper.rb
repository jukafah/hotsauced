# frozen_string_literal: true

module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    elsif cookies.signed[:remember_token]
      @current_user ||= User.find_by(remember_digest: cookies.signed[:remember_token])
      sign_in(@current_user)
      remember(@current_user)
    end
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:remember_token] = user.remember_token
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def forget(user)
    user.forget
    cookies.delete(:remember_token)
  end
end
