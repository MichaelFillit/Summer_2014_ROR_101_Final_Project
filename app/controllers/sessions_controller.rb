class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      flash[:notice] = "You've been logged in."
      session[:user_id] = user.id
      redirect_to(user_dashboards_path(user))
    else
      flash[:alert] = "There was a problem logging you in."
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been logged out successfully."
    redirect_to log_in_form_path
  end
end
