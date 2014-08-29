class Addrange < ActiveRecord::Migration
  def change
  	add_column :dateranges, :yearto, :string
  	add_column :dateranges, :monthto, :string
  	add_column :dateranges, :dateto, :string
  end
end
