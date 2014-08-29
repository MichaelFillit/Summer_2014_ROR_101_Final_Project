class RcostsController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @rCost = Rcost.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @rCost = Rcost.new
    @rCost.user_id = @user.id
    @rCost.dashboard_id = @dashboard.id
  end

  def edit
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @rCost = Rcost.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @rCost = Rcost.find(params[:id])
    @rCost.title = params[:rcost][:title]
    @rCost.rcost = params[:rcost][:rcost]
    @rCost.date = params[:rcost][:date]
    if @rCost.save
      flash[:notice] = "Your Real Cost entry was edited successfully."
      redirect_to(user_dashboard_rcost_path(@user, @dashboard, @rCost))
    else
      #flash[:alert] = "There was a problem editing your Real cost entry."
      #redirect_to(edit_rcost_path(rcost))
      render "edit"
    end
  end

  def create
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @rCost = Rcost.new
    @rCost.date = params[:rcost][:date]
    @rCost.title = params[:rcost][:title]
    rCosttemp = params[:rcost][:rcost]
    @rCost.rcost = rCosttemp.gsub(/,/, '').to_f
    @rCost.dashboard_id = @dashboard.id
    @rCost.user_id = @user.id
    if @rCost.save
      flash[:notice] = "Your Real cost entry was created successfully."
      redirect_to(user_dashboard_rcost_path(@user, @dashboard, @rCost))
    else
      flash[:alert] = "There was a problem saving your Real Cost entry."
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    rCost = Rcost.find(params[:id])
    if rCost.delete
      flash[:notice] = "Your Real Cost entry was deleted successfully."
      redirect_to(user_dashboard_path(@user, @dashboard))
    else
      flash[:alert] = "There was a problem deleting your Real Cost entry."
      redirect_to(user_dashboard_rcost_path(@user, @dashboard, @rCost))
    end
  end
end
