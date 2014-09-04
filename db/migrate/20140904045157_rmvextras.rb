class Rmvextras < ActiveRecord::Migration
  def change
  	remove_column :dateranges, :year
  	remove_column :dateranges, :month
  	remove_column :dateranges, :day
  end
end
