class Nottofrom < ActiveRecord::Migration
  def change
  	rename_column :dateranges, :year, :yearfrom
  	rename_column :dateranges, :month, :monthfrom
  	rename_column :dateranges, :day, :dayfrom
  end
end
