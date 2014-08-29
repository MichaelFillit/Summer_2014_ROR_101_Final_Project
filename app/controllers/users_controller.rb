class UsersController < ApplicationController
  def index
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the site!"
      redirect_to(user_dashboards_path(@user))
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      render "new"
    end
  end
  def show
  end
  def update
  end
  def destroy
  end
  def edit
  end
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
