class DaterangesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
   	@daterange = Daterange.new
    @daterange.datefrom = params[:daterange][:datefrom]
    @daterange.dateto = params[:daterange][:dateto]
    if @daterange.save
      redirect_to(user_dashboard_path(@user, @dashboard))
    else
      render "new"
    end
  end
  def new
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @daterange = Daterange.new
    @daterange.user_id = @user.id
    @daterange.dashboard_id = @dashboard.id
  end

  def edit
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @daterange = Daterange.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @daterange = Daterange.find(params[:id])
    @daterange.year = params[:datrange][:year]
    @daterange.month = params[:datrange][:month]
    @daterange.day = params[:datrange][:day]
    @daterange.yearto = params[:datrange][:yearto]
    @daterange.monthto = params[:datrange][:monthto]
    @daterange.dayto = params[:datrange][:dayto]
    if @daterange.save
      flash[:notice] = "Your Date Range was edited successfully."
      redirect_to(user_dashboard_path(@user, @dashboard))
    else
      flash[:alert] = "There was a problem editing your Date Range."
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    daterange = Daterange.find(params[:id])
    if daterange.delete
      flash[:notice] = "Your Date Range was deleted successfully."
      redirect_to(user_dashboard_path(@user, @dashboard))
    else
      flash[:alert] = "There was a problem deleting your Date Range."
      redirect_to(user_dashboard_daterange_path(@user, @dashboard, daterange))
    end
  end
end
