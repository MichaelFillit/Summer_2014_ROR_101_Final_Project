class AddBalance < ActiveRecord::Migration
  def change
  	add_column :dashboards, :balance, :float
  end
end
