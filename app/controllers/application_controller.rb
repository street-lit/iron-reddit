class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :user_logged_in?

  skip_before_filter :authenticate_user, only: [:show, :new, :create]
  # before_action :authenticate_user

  def user_logged_in?
    session[:logged_in_users_id].present?
  end

  def authenticate_user
    unless user_logged_in?
      redirect_to new_login_path
    end
  end

  def current_user
    if user_logged_in?
      User.find(session[:logged_in_users_id])
    end
  end
end
