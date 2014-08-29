class EincomesController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @eIncome = Eincome.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @eIncome = Eincome.new
    @eIncome.user_id = @user.id
    @eIncome.dashboard_id = @dashboard.id
  end

  def edit
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @eIncome = Eincome.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @eIncome = Eincome.find(params[:id])
    @eIncome.title = params[:eincome][:title]
    @eIncome.eincome = params[:eincome][:eincome]
    @eIncome.date = params[:eincome][:date]
    if @eIncome.save
      flash[:notice] = "Your Expected Income entry was edited successfully."
      redirect_to(user_dashboard_eincome_path(@user, @dashboard, @eIncome))
    else
      flash[:alert] = "There was a problem editing your Expected Income entry."
      render "edit"
    end
  end

  def create
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    @eIncome = Eincome.new
    @eIncome.title = params[:eincome][:title]
    @eIncome.date = params[:eincome][:date]
    eIncometemp = params[:eincome][:eincome]
    @eIncome.eincome = eIncometemp.gsub(/,/, '').to_f
    @eIncome.dashboard_id = @dashboard.id
    @eIncome.user_id = @user.id
    if @eIncome.save
      flash[:notice] = "Your Expected Income entry was created successfully."
      redirect_to (user_dashboard_eincome_path(@user, @dashboard, @eIncome))
    else
      flash[:alert] = "There was a problem saving your Expected Income entry."
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @dashboard = Dashboard.find(params[:dashboard_id])
    eIncome = Eincome.find(params[:id])
    if eIncome.delete
      flash[:notice] = "Your Expected Income entry was deleted successfully."
      redirect_to(user_dashboard_path(@user, @dashboard))
    else
      flash[:alert] = "There was a problem deleting your Expected Income entry."
      redirect_to(user_dashboard_eincome_path(@user, @dashboard, @eIncome))
    end
  end
end
