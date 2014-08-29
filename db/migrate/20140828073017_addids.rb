class Addids < ActiveRecord::Migration
  def change
  	add_column :dateranges, :user_id, :integer
  	add_column :dateranges, :dashboard_id, :integer
  end
end
