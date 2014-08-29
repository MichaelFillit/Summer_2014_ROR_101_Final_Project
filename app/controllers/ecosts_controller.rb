class EcostsController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @eCost = Ecost.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @eCost = Ecost.new
    @eCost.user_id = @user.id
    @eCost.dashboard_id = @dashboard.id
  end

  def edit
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @eCost = Ecost.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @eCost = Ecost.find(params[:id])
    @eCost.title = params[:ecost][:title]
    @eCost.ecost = params[:ecost][:ecost]
    @eCost.date = params[:ecost][:date]
    if @eCost.save
      flash[:notice] = "Your Expected Cost entry was edited successfully."
      redirect_to(user_dashboard_ecost_path(@user, @dashboard, @eCost))
    else
      #flash[:alert] = "There was a problem editing your Expected cost entry."
      #redirect_to(edit_ecost_path(ecost))
      render "edit"
    end
  end

  def create
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @eCost = Ecost.new
    @eCost.title = params[:ecost][:title]
    @eCost.date = params[:ecost][:date]
    eCosttemp = params[:ecost][:ecost]
    @eCost.ecost = eCosttemp.gsub(/,/, '').to_f
    @eCost.dashboard_id = @dashboard.id
    @eCost.user_id = @user.id
    if @eCost.save
      flash[:notice] = "Your Expected Cost entry was created successfully."
      redirect_to(user_dashboard_ecost_path(@user, @dashboard, @eCost))
    else
      flash[:alert] = "There was a problem saving your Expected cost entry."
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    eCost = Ecost.find(params[:id])
    if eCost.delete
      flash[:notice] = "Your Expected Cost entry was deleted successfully."
      redirect_to(user_dashboard_path(@user, @dashboard))
    else
      flash[:alert] = "There was a problem deleting your Expected Cost entry."
      redirect_to(user_dashboard_ecost_path(@user, @dashboard, eCost))
    end
  end

end
