class Adddft < ActiveRecord::Migration
  def change
  	add_column :dateranges, :datefrom, :date
  	add_column :dateranges, :dateto, :date
  end
end
