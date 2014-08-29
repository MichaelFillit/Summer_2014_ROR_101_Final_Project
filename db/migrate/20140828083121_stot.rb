class Stot < ActiveRecord::Migration
  def change
  	change_column :dateranges, :yearfrom, :integer
  	change_column :dateranges, :monthfrom, :integer
  	change_column :dateranges, :dayfrom, :integer
  	change_column :dateranges, :yearto, :integer
  	change_column :dateranges, :monthto, :integer
  	change_column :dateranges, :dayto, :integer
  end
end
