class Remdrc < ActiveRecord::Migration
  def change
  	remove_column :dateranges, :yearfrom
  	remove_column :dateranges, :monthfrom
  	remove_column :dateranges, :dayfrom
  	remove_column :dateranges, :yearto
  	remove_column :dateranges, :monthto
  	remove_column :dateranges, :dayto
  end
end
