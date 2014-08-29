class AddDashboardId < ActiveRecord::Migration
  def change
  	add_column :rincomes, :dashboard_id, :integer
  	add_column :eincomes, :dashboard_id, :integer
  	add_column :rcosts, :dashboard_id, :integer
  	add_column :ecosts, :dashboard_id, :integer
  	add_column :rincomes, :user_id, :integer
  	add_column :eincomes, :user_id, :integer
  	add_column :rcosts, :user_id, :integer
  	add_column :ecosts, :user_id, :integer
  end
end