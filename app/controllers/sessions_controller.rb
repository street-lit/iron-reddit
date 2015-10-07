class SessionsController < ApplicationController
  def new
  end

  def create # create login session
    user = User.find_by_email(params[:email])
    if user.present? && user.authenticate(params[:password])
      set_user_session(user)
      redirect_to links_path, notice: "Successfully logged in!"
    else
      flash[:alert] = 'Username or Password did not match.'
      render :new
    end
  end

  def destroy
    session[:logged_in_user] = nil
    redirect_to root_path
  end

  private

  def set_user_session(user)
    session[:logged_in_user] = user.id
  end
end
