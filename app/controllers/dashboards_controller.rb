class DashboardsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.where("user_id = ?", @user.id)
  end
  def show
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.new
    @dashboard.user_id = @user.id
  end

  def edit
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:id])
    @dashboard.title = params[:dashboard][:title]
    balancetemp = params[:dashboard][:balance]
    @dashboard.balance = balancetemp.gsub(/,/, '').to_f
    if @dashboard.save
      flash[:notice] = "Your Dashboard was edited successfully."
      redirect_to(user_dashboard_path(@user, @dashboard))
    else
      flash[:alert] = "There was a problem editing your Dashboard."
      render "edit"
    end
  end

  def create
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.new
    @dashboard.title = params[:dashboard][:title]
    balancetemp = params[:dashboard][:balance]
    @dashboard.balance = balancetemp.gsub(/,/, '').to_f
    @dashboard.user_id = @user.id
    if @dashboard.save
      flash[:notice] = "Your Dashboard was created successfully."
      redirect_to(user_dashboards_path(@user))
    else
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    dashboard = Dashboard.find(params[:id])
    if dashboard.delete
      flash[:notice] = "Your Dashboard was deleted successfully."
      redirect_to(user_dashboards_path(@user))
    else
      flash[:alert] = "There was a problem deleting your Dashboard."
      redirect_to(user_dashboards_path(@user))
    end
  end
end
