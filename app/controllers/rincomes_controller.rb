class RincomesController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @rIncome = Rincome.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @rIncome = Rincome.new
    @rIncome.user_id = @user.id
    @rIncome.dashboard_id = @dashboard.id
  end

  def edit
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @rIncome = Rincome.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @rIncome = Rincome.find(params[:id])
    @rIncome.title = params[:rincome][:title]
    @rIncome.rincome = params[:rincome][:rincome]
    @rIncome.date = params[:rincome][:date]
    if @rIncome.save
      flash[:notice] = "Your Real Income entry was edited successfully."
      redirect_to(user_dashboard_rincome_path(@user, @dashboard, @rIncome))
    else
      flash[:alert] = "There was a problem editing your Real Income entry."
      render "edit"
    end
  end

  def create
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @rIncome = Rincome.new
    @rIncome.title = params[:rincome][:title]
    @rIncome.date = params[:rincome][:date]
    rIncometemp = params[:rincome][:rincome]
    @rIncome.rincome = rIncometemp.gsub(/,/, '').to_f
    @rIncome.dashboard_id = @dashboard.id
    @rIncome.user_id = @user.id
    if @rIncome.save
      flash[:notice] = "Your Real Income entry was created successfully."
      redirect_to(user_dashboard_rincome_path(@user, @dashboard, @rIncome))
    else
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    rIncome = Rincome.find(params[:id])
    if rIncome.delete
      flash[:notice] = "Your Real Income entry was deleted successfully."
      redirect_to(user_dashboard_path(@user, @dashboard))
    else
      flash[:alert] = "There was a problem deleting your Real Income entry."
      redirect_to (user_dashboard_rincome_path(@user, @dashboard, @rIncome))
    end
  end
end
