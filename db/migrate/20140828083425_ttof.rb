class Ttof < ActiveRecord::Migration
  def change
  	change_column :dateranges, :yearfrom, :float
  	change_column :dateranges, :monthfrom, :float
  	change_column :dateranges, :dayfrom, :float
  	change_column :dateranges, :yearto, :float
  	change_column :dateranges, :monthto, :float
  	change_column :dateranges, :dayto, :float
  end
end
